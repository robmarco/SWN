/*
 * File:        dateFilter_dataTable.js
 * Version:     1.0
 * Author:      Roberto Marco
 * Info:        Expand datatables
 * 
 * This source file is free software
 * 
 * This source file is distributed in the hope that it will be useful, but 
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
 * or FITNESS FOR A PARTICULAR PURPOSE. See the license files for details.
 *
 * Details: Needs that user insert a min, max input[type=text] which acts as selectors
 * Example:
 * 				<div class="datatable_custom_filter">
 *					<div class="min">
 *						Desde: <input type="text" class="date_mask" id="fmin">
 *					</div>
 *					<div class="max">
 *						Hasta: <input type="text" class="date_mask" id="fmax">
 *					</div>
 *				</div>
 */

function dateFilter_dataTable(table_selector, min_selector, max_selector,
															column_sort, type_sort) {

	$.fn.dataTableExt.afnFiltering.push(
		function( oSettings, aData, iDataIndex ) {
			var iMin = $(min_selector).val(),
					iMax = $(max_selector).val(),
					iDate = aData[0].split("/");

			//Convert to Dates
			iDate = new Date([iDate[1],iDate[0],iDate[2]].join("/"));
			
			if (iMin != "") {
				iMin = iMin.split("/");	        	
				iMin = new Date([iMin[1],iMin[0],iMin[2]].join("/"));
			}

			if (iMax != "") {
				iMax = iMax.split("/");
				iMax = new Date([iMax[1],iMax[0],iMax[2]].join("/"));
			}

			if ( iMin == "" && iMax == "" )
			{
				return true;
			}
			else if ( iMin == "" && iDate <= iMax )
			{
				return true;
			}
			else if ( iMin <= iDate && "" == iMax )
			{
				return true;
			}
			else if ( iMin <= iDate && iDate <= iMax )
			{
				return true;
			}
			return false;
			
		}
	);

	$(function() {
		/* Initialise datatables */
		var oTable = $(table_selector).dataTable({
											"aaSorting": [[column_sort, type_sort]]
									});

		/* Add event listeners to the two range filtering inputs */
		$(min_selector).bind('change', function() {
			oTable.fnDraw();
		});

		$(max_selector).bind('change', function() {
			oTable.fnDraw();
		});
	});         

};