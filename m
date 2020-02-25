Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913B6C4BA06
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 23:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BBAC24680
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 23:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbgBYXfM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 18:35:12 -0500
Received: from mga11.intel.com ([192.55.52.93]:22050 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726827AbgBYXfM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 25 Feb 2020 18:35:12 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 15:35:11 -0800
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; 
   d="scan'208";a="226519250"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.165.21.202])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 15:35:10 -0800
Date:   Tue, 25 Feb 2020 15:36:12 -0800
From:   Rodrigo Vivi <rodrigo.vivi@intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
        intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH 7/7] docs: gpu: i915.rst: fix warnings due to file renames
Message-ID: <20200225233612.GB347826@intel.com>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <ab08b73be87b66700f244a4e41db8a5e7e768916.1582361738.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab08b73be87b66700f244a4e41db8a5e7e768916.1582361738.git.mchehab+huawei@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 22, 2020 at 10:00:07AM +0100, Mauro Carvalho Chehab wrote:
> Fix two warnings due to file rename:
> 
> 	WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -function csr support for dmc ./drivers/gpu/drm/i915/intel_csr.c' failed with return code 1
> 	WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -internal ./drivers/gpu/drm/i915/intel_csr.c' failed with return code 2
> 
> Fixes: 06d3ff6e7451 ("drm/i915: move intel_csr.[ch] under display/")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  Documentation/gpu/i915.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index e539c42a3e78..cc74e24ca3b5 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -207,10 +207,10 @@ DPIO
>  CSR firmware support for DMC
>  ----------------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/i915/intel_csr.c
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_csr.c
>     :doc: csr support for dmc
>  
> -.. kernel-doc:: drivers/gpu/drm/i915/intel_csr.c
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_csr.c
>     :internal:
>  
>  Video BIOS Table (VBT)
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
