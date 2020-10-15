package com.demo.tags;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

public class sliderTag extends RequestContextAwareTag{

	private static final long serialVersionUID = 5919380581149628277L;
	
	
	@Override
	public void doFinally() {
		JspWriter jspWriter = pageContext.getOut();
		try {
			jspWriter.write("  <!-- end nav --> \r\n"
					+ "  \r\n"
					+ "  <!-- Slider -->\r\n"
					+ "  <section class=\"slider-intro\">\r\n"
					+ "    <div class=\"container\">\r\n"
					+ "      <div class=\"the-slideshow slideshow-wrapper\">\r\n"
					+ "        <ul style=\"overflow: hidden;\" class=\"slideshow\">\r\n"
					+ "          <li class=\"slide\">\r\n"
					+ "            <p><a href=\"#\"> <img src=\"${pageContext.request.contextPath}/resources/user/images/banner-img.jpg\" alt=\"\"></a></p>\r\n"
					+ "            <div class=\"caption light1 top-right\">\r\n"
					+ "              <div class=\"caption-inner\">\r\n"
					+ "                <p class=\"heading\">Women Collection 2014</p>\r\n"
					+ "                <div class=\"badge\"><em>up to</em> 70% <span>OFF</span></div>\r\n"
					+ "                <p class=\"heading1\">Lorem Ipsum is simply dummy text of the printing and typesetting industry  it has been the industry's standard dummy</p>\r\n"
					+ "                <p class=\"intro-btn\"><a  href=\"#\" title=\"Click to see all features\">Shop Now</a> </p>\r\n"
					+ "              </div>\r\n"
					+ "            </div>\r\n"
					+ "          </li>\r\n"
					+ "          <li class=\"slide\">\r\n"
					+ "            <p><a href=\"#\"> <img src=\"${pageContext.request.contextPath}/resources/user/images/banner-img1.jpg\" alt=\"\"></a></p>\r\n"
					+ "            <div class=\"caption light top-right\">\r\n"
					+ "              <div class=\"caption-inner\">\r\n"
					+ "                <p class=\"normal-text\">Collection 2014</p>\r\n"
					+ "                <h2 class=\"heading permanent\">You like this theme</h2>\r\n"
					+ "                <p class=\"normal-text1\">tristique senectus </p>\r\n"
					+ "                <p class=\"intro-btn\"><a  href=\"#\" title=\"Click to see all features\">Buy Now</a> </p>\r\n"
					+ "              </div>\r\n"
					+ "            </div>\r\n"
					+ "          </li>\r\n"
					+ "          <li class=\"slide\">\r\n"
					+ "            <p><a title=\"#\" href=\"#\"> <img src=\"${pageContext.request.contextPath}/resources/user/images/banner-img2.jpg\" alt=\"\"> </a></p>\r\n"
					+ "            <div class=\"caption light2 top-right\">\r\n"
					+ "              <div class=\"caption-inner\">\r\n"
					+ "                <p class=\"heading\">Responsive Layout</p>\r\n"
					+ "              </div>\r\n"
					+ "            </div>\r\n"
					+ "          </li>\r\n"
					+ "        </ul>\r\n"
					+ "        <a href=\"#\" id=\"home-slides-prev\" class=\"backward browse-button\">previous</a> <a href=\"#\" id=\"home-slides-next\" class=\"forward browse-button\">next</a>\r\n"
					+ "        <div id=\"home-slides-pager\" class=\"tab-pager tab-pager-img tab-pager-ring-lgray\"></div>\r\n"
					+ "      </div>\r\n"
					+ "    </div>\r\n"
					+ "  </section>\r\n"
					+ "  <!-- end Slider --> \r\n"
					+ "  <!-- service section  -->\r\n"
					+ "  <div class=\"service-section\">\r\n"
					+ "    <div class=\"container\">\r\n"
					+ "      <div id=\"store-messages\">\r\n"
					+ "        <div class=\"message col-lg-3 col-sm-6 col-xs-12\"><i class=\"icon-refresh\">&nbsp;</i> <span><strong>Return &amp; Exchange</strong> in 3 days </span> </div>\r\n"
					+ "        <div class=\"message col-lg-3 col-sm-6 col-xs-12\"><i class=\"icon-truck\">&nbsp;</i><span><strong>Free Shipping</strong> order over $99</span> </div>\r\n"
					+ "        <div class=\"message col-lg-3 col-sm-6 col-xs-12\"><i class=\"icon-discount\">&nbsp;</i><span><strong>50% off</strong> on all products</span> </div>\r\n"
					+ "        <div class=\"phone col-lg-3 col-sm-6 col-xs-12\"><i class=\"icon-phone\"></i>&nbsp;<span><strong>Need help?</strong> +1 800 123 1234</span> </div>\r\n"
					+ "      </div>\r\n"
					+ "    </div>\r\n"
					+ "  </div>");
		} catch (Exception e) {
			try {
				jspWriter.write(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	@Override
	protected int doStartTagInternal() throws Exception {

		return 0;
	}
}
