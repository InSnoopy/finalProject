<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<section id="portfolio" class="portfolio" style="padding-top: 160px;">
	<div class="container aos-init aos-animate" data-aos="fade-up">
		<div class="section-title">
			<h2>PMS툴 소개</h2>
		</div>
		<ul id="portfolio-flters"
			class="d-flex justify-content-center aos-init aos-animate"
			data-aos="fade-up" data-aos-delay="100">
			<li data-filter="*" class="filter-active">All</li>
			<li data-filter=".filter-app">App</li>
			<li data-filter=".filter-card">Card</li>
			<li data-filter=".filter-web">Web</li>
		</ul>
		<div class="row portfolio-container aos-init aos-animate"
			data-aos="fade-up" data-aos-delay="200"
			style="position: relative; height: 1097.33px;">
			
			
			<div class="col-lg-4 col-md-6 portfolio-item filter-app"
				style="position: absolute; left: 0px; top: 0px;">
				<div class="portfolio-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/main/main3.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>App 1</h4>
					<p>App</p>
					<a
						href="${pageContext.request.contextPath }/resources/images/main/main3.png"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="App 1"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 portfolio-item filter-web"
				style="position: absolute; left: 380px; top: 0px;">
				<div class="portfolio-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/main/main3.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>Web 3</h4>
					<p>Web</p>
					<a
						href="${pageContext.request.contextPath }/resources/images/main/main3.png"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Web 3"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 portfolio-item filter-app"
				style="position: absolute; left: 760px; top: 0px;">
				<div class="portfolio-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/main/main3.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>App 2</h4>
					<p>App</p>
					<a
						href="${pageContext.request.contextPath }/resources/images/main/main3.png"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="App 2"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 portfolio-item filter-card"
				style="position: absolute; left: 760px; top: 230.25px;">
				<div class="portfolio-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/main/main3.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>Card 2</h4>
					<p>Card</p>
					<a
						href="${pageContext.request.contextPath }/resources/images/main/main3.png"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Card 2"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 portfolio-item filter-web"
				style="position: absolute; left: 380px; top: 268.688px;">
				<div class="portfolio-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/main/main3.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>Web 2</h4>
					<p>Web</p>
					<a
						href="${pageContext.request.contextPath }/resources/images/main/main3.png"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Web 2"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 portfolio-item filter-app"
				style="position: absolute; left: 0px; top: 390.891px;">
				<div class="portfolio-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/main/main3.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>App 3</h4>
					<p>App</p>
					<a
						href="${pageContext.request.contextPath }/resources/images/main/main3.png"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="App 3"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 portfolio-item filter-card"
				style="position: absolute; left: 760px; top: 495.641px;">
				<div class="portfolio-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/main/main3.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>Card 1</h4>
					<p>Card</p>
					<a
						href="${pageContext.request.contextPath }/resources/images/main/main3.png"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Card 1"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 portfolio-item filter-card"
				style="position: absolute; left: 760px; top: 756.719px;">
				<div class="portfolio-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/main/main3.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>Card 3</h4>
					<p>Card</p>
					<a
						href="${pageContext.request.contextPath }/resources/images/main/main3.png"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Card 3"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 portfolio-item filter-web"
				style="position: absolute; left: 380px; top: 830.844px;">
				<div class="portfolio-img">
					<img
						src="${pageContext.request.contextPath }/resources/images/main/main3.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>Web 3</h4>
					<p>Web</p>
					<a
						href="${pageContext.request.contextPath }/resources/images/portfolio/portfolio-9.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Web 3"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>
		</div>
	</div>
</section>


<section id="faq" class="faq section-bg">


	<div class="container aos-init aos-animate" data-aos="fade-up">
		<div class="section-title">
			<h2>BLUE MINE</h2>
			
		</div>
		<div class="faq-list">
			<ul>
				<li data-aos="fade-up" data-aos-delay="100"
					class="aos-init aos-animate"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" class="collapse"
					data-bs-target="#faq-list-1">Non consectetur a erat nam at
						lectus urna duis? <i class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i>
				</a>
				<div id="faq-list-1" class="collapse show"
						data-bs-parent=".faq-list">
						<p>Feugiat pretium nibh ipsum consequat. Tempus iaculis urna
							id volutpat lacus laoreet non curabitur gravida. Venenatis lectus
							magna fringilla urna porttitor rhoncus dolor purus non.</p>
					</div></li>
				<li data-aos="fade-up" data-aos-delay="200"
					class="aos-init aos-animate"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" data-bs-target="#faq-list-2"
					class="collapsed">Feugiat scelerisque varius morbi enim nunc? <i
						class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i></a>
				<div id="faq-list-2" class="collapse" data-bs-parent=".faq-list">
						<p>Dolor sit amet consectetur adipiscing elit pellentesque
							habitant morbi. Id interdum velit laoreet id donec ultrices.
							Fringilla phasellus faucibus scelerisque eleifend donec pretium.
							Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros
							in cursus turpis massa tincidunt dui.</p>
					</div></li>
				<li data-aos="fade-up" data-aos-delay="300"
					class="aos-init aos-animate"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" data-bs-target="#faq-list-3"
					class="collapsed">Dolor sit amet consectetur adipiscing elit? <i
						class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i></a>
				<div id="faq-list-3" class="collapse" data-bs-parent=".faq-list">
						<p>Eleifend mi in nulla posuere sollicitudin aliquam ultrices
							sagittis orci. Faucibus pulvinar elementum integer enim. Sem
							nulla pharetra diam sit amet nisl suscipit. Rutrum tellus
							pellentesque eu tincidunt. Lectus urna duis convallis convallis
							tellus. Urna molestie at elementum eu facilisis sed odio morbi
							quis</p>
					</div></li>
				<li data-aos="fade-up" data-aos-delay="400"
					class="aos-init aos-animate"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" data-bs-target="#faq-list-4"
					class="collapsed">Tempus quam pellentesque nec nam aliquam sem
						et tortor consequat? <i class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i>
				</a>
				<div id="faq-list-4" class="collapse" data-bs-parent=".faq-list">
						<p>Molestie a iaculis at erat pellentesque adipiscing commodo.
							Dignissim suspendisse in est ante in. Nunc vel risus commodo
							viverra maecenas accumsan. Sit amet nisl suscipit adipiscing
							bibendum est. Purus gravida quis blandit turpis cursus in.</p>
					</div></li>
				<li data-aos="fade-up" data-aos-delay="500"
					class="aos-init aos-animate"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" data-bs-target="#faq-list-5"
					class="collapsed">Tortor vitae purus faucibus ornare. Varius
						vel pharetra vel turpis nunc eget lorem dolor? <i
						class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i>
				</a>
				<div id="faq-list-5" class="collapse" data-bs-parent=".faq-list">
						<p>Laoreet sit amet cursus sit amet dictum sit amet justo.
							Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt
							eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor
							sed. Ut venenatis tellus in metus vulputate eu scelerisque.</p>
					</div></li>
			</ul>
		</div>
	</div>
</section>