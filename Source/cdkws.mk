.PHONY: clean All Project_Title Project_Build

All: Project_Title Project_Build

Project_Title:
	@echo "----------Building project:[ apt32f102 - BuildSet ]----------"

Project_Build:
	@make -r -f apt32f102.mk -j 12 -C  ./ 


clean:
	@echo "----------Cleaning project:[ apt32f102 - BuildSet ]----------"

