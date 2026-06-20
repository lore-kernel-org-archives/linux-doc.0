Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF1F4369A
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 21:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781991739; cv=none; b=iQy3TctleIWa1NtclQgvoBLlvn1VT1NuhKSOB2od/MH+Q0AFu2wqNTUTik2OjhlSCHPQN2VjFokn2CFkt0eOPqLcu1NDr53llDzKzSR3ctXE4eueptNTOSIhjKQXwznhVOAJIiTh5krbmjBCKJgq3NCZmKPyeeQ4+lNPFyuDTKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781991739; c=relaxed/simple;
	bh=nAo4oZH/orMGs6YonkZrkoGqgMEfNCzPz5734ZN4KjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiZ0aKo2jxGf0qH39tb0wl6QldeoZI7pzU7X9vuuqj4R2HBQPVi1BR9qQNnhqh/N1qqSbHx4CuJ9xtrZE9n2OMbrl3vuOmg1Q2kOoYKK2rKYdHkKsdek49nRCChHXj6bvu/QnyarGLAVdT4nxgjMee4rkf2d6VYuoa4z9E1TV/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1snmQBtg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1snmQBtg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uuaMkh35C+M2WN+W4Ps1GRQRooklEcMeJHCBQxlSQKo=; b=1snmQBtgT/uqttTLcjPBG93Jtp
	5Xpbb2XjuUjv5h70bQi3OTzq7As0H4DYZDb8Di4RJvZT3IMr9fNWq3EEuULbBXX0quC1ToywcY3Kh
	M0pF1eE/gj66kOKx7mAkBhjOPoT8e4+o6I3pz3MFkJcl3JkXs7/u9OrxSJIeWJnlEYi0Dq4BhGTmU
	VSS3P+vk8BIBya8X9+p7prj9ZZjrc3m3A1JTpLtFSGZNoK+uP5e7WGmga/Fbdwiawt+dsr2GQtQOD
	fiPwJCNE3y0tvvYMBUKJVhNXNUgO2+UWHSiWJ8pN96U1E8xWIN67EVXIFOKbXM1jHiFQFpzR+FJsP
	GzGP23pQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb3SC-00000003aE5-3bzl;
	Sat, 20 Jun 2026 21:42:16 +0000
Message-ID: <4130fd7c-6f7c-4b03-ad64-7a738e2f0bc9@infradead.org>
Date: Sat, 20 Jun 2026 14:42:16 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Documentation: xe_drm: fix chars used for subsection
To: Rafael Passos <rafael@rcpassos.me>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org
References: <20260620201732.94141-1-rafael@rcpassos.me>
 <20260620201732.94141-3-rafael@rcpassos.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260620201732.94141-3-rafael@rcpassos.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/20/26 1:16 PM, Rafael Passos wrote:
> Equal signs are reserved for document tiles"="

                                        titles.

> this file docs gets imported by driver-uapi.rst,

  This

> and the page title is defined there.

It would be helpful to include the warnings here (but maybe not
all 10 lines of each warning).

This patch does indeed prevent the warnings.

You should send this patch the the DRM XE maintainers & mailing list.
INTEL DRM DISPLAY FOR XE AND I915 DRIVERS
M:	Jani Nikula <jani.nikula@linux.intel.com>
M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
L:	intel-gfx@lists.freedesktop.org
L:	intel-xe@lists.freedesktop.org

scripts/get_maintainer.pl should have told you that. (It does for me.)

Thanks.

> 
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
> ---
>  include/uapi/drm/xe_drm.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 48e9f1fdb78d..4dfb30e6c8a8 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2537,21 +2537,21 @@ struct drm_xe_exec_queue_set_property {
>   * Refer to Documentation/netlink/specs/drm_ras.yaml for complete interface specification.
>   *
>   * Node Registration
> - * =================
> + * -----------------
>   *
>   * The driver registers DRM RAS nodes for each error severity level.
>   * enum drm_xe_ras_error_severity defines the node-id, while DRM_XE_RAS_ERROR_SEVERITY_NAMES maps
>   * node-id to node-name.
>   *
>   * Error Classification
> - * ====================
> + * --------------------
>   *
>   * Each node contains a list of error counters. Each error is identified by a error-id and
>   * an error-name. enum drm_xe_ras_error_component defines the error-id, while
>   * DRM_XE_RAS_ERROR_COMPONENT_NAMES maps error-id to error-name.
>   *
>   * User Interface
> - * ==============
> + * --------------
>   *
>   * To retrieve error values of a error counter, userspace applications should
>   * follow the below steps:

-- 
~Randy

