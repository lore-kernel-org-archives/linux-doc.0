Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 890807D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Feb 2019 19:33:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfBSTd5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Feb 2019 14:33:57 -0500
Received: from merlin.infradead.org ([205.233.59.134]:33406 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfBSTd5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Feb 2019 14:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pdxH2yC49Vt1I2WmRTc+oJEd7ueqaqoD8BAEd/6hGRg=; b=Z5djS6w2qESrNxdDQ1CffCgeE/
        pV9Kbwi+aGmXlpU9B/31SZX3IUF11MjsucTOXi7Mtf1z4V/27/iwGo8sUYfQK5ty4pqoQtLSl7y18
        6UVHFdKUXeysJCbCWd8kCs2VZkyLx/ymkJndMy2iGAQPSvLc9qdpEKfqWKulElSOc1cajMKuIQdod
        az2RjNFAPzukT30VB7zCeZwTVL60eubiU+V3Uy1J++XhCZfKK7M5WnULMILqbEi75p9z9n9YAXhRK
        At6QlMsCCCqKe0eZnJW9dM7c2y+C8jgMvyjueldPGv8dFkS1Jl4zcJ1SnLCrI6nhniuO6WbmQugAV
        vxfIYDDA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gwB9P-0000K1-2u; Tue, 19 Feb 2019 19:33:55 +0000
Subject: Re: [PATCH 02/11] topolgy: simplify cputopology.txt formatting and
 wording
To:     Len Brown <lenb@kernel.org>, linux-drivers-review@linux.intel.com
Cc:     linux-doc@vger.kernel.org
References: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
 <e13cb72d48bdaed80b681abf89bc77d58931db51.1550545163.git.len.brown@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9108bd98-e9f4-fee3-80c7-72d540c48291@infradead.org>
Date:   Tue, 19 Feb 2019 11:33:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <e13cb72d48bdaed80b681abf89bc77d58931db51.1550545163.git.len.brown@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/18/19 7:22 PM, Len Brown wrote:
> No semantic changes.
> 
> Signed-off-by: Len Brown <len.brown@intel.com>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Len Brown <len.brown@intel.com>
> ---
>  Documentation/cputopology.txt | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/cputopology.txt b/Documentation/cputopology.txt
> index c6e7e9196a8b..2698da7e4f49 100644
> --- a/Documentation/cputopology.txt
> +++ b/Documentation/cputopology.txt
> @@ -3,76 +3,76 @@ How CPU topology info is exported via sysfs
>  ===========================================
>  
>  Export CPU topology info via sysfs. Items (attributes) are similar
> -to /proc/cpuinfo output of some architectures:
> +to /proc/cpuinfo output of some architectures.  They reside in
> +/sys/devices/system/cpu/cpuX/topology/:
>  
> -1) /sys/devices/system/cpu/cpuX/topology/physical_package_id:
> +physical_package_id:
>  
>  	physical package id of cpuX. Typically corresponds to a physical
>  	socket number, but the actual value is architecture and platform
>  	dependent.
>  
> -2) /sys/devices/system/cpu/cpuX/topology/core_id:
> +core_id:
>  
>  	the CPU core ID of cpuX. Typically it is the hardware platform's
>  	identifier (rather than the kernel's).  The actual value is
>  	architecture and platform dependent.
>  
> -3) /sys/devices/system/cpu/cpuX/topology/book_id:
> +book_id:
>  
>  	the book ID of cpuX. Typically it is the hardware platform's
>  	identifier (rather than the kernel's).	The actual value is
>  	architecture and platform dependent.
>  
> -4) /sys/devices/system/cpu/cpuX/topology/drawer_id:
> +drawer_id:
>  
>  	the drawer ID of cpuX. Typically it is the hardware platform's
>  	identifier (rather than the kernel's).	The actual value is
>  	architecture and platform dependent.
>  
> -5) /sys/devices/system/cpu/cpuX/topology/thread_siblings:
> +thread_siblings:
>  
>  	internal kernel map of cpuX's hardware threads within the same
>  	core as cpuX.
>  
> -6) /sys/devices/system/cpu/cpuX/topology/thread_siblings_list:
> +thread_siblings_list:
>  
>  	human-readable list of cpuX's hardware threads within the same
>  	core as cpuX.
>  
> -7) /sys/devices/system/cpu/cpuX/topology/core_siblings:
> +core_siblings:
>  
>  	internal kernel map of cpuX's hardware threads within the same
>  	physical_package_id.
>  
> -8) /sys/devices/system/cpu/cpuX/topology/core_siblings_list:
> +core_siblings_list:
>  
>  	human-readable list of cpuX's hardware threads within the same
>  	physical_package_id.
>  
> -9) /sys/devices/system/cpu/cpuX/topology/book_siblings:
> +book_siblings:
>  
>  	internal kernel map of cpuX's hardware threads within the same
>  	book_id.
>  
> -10) /sys/devices/system/cpu/cpuX/topology/book_siblings_list:
> +book_siblings_list:
>  
>  	human-readable list of cpuX's hardware threads within the same
>  	book_id.
>  
> -11) /sys/devices/system/cpu/cpuX/topology/drawer_siblings:
> +drawer_siblings:
>  
>  	internal kernel map of cpuX's hardware threads within the same
>  	drawer_id.
>  
> -12) /sys/devices/system/cpu/cpuX/topology/drawer_siblings_list:
> +drawer_siblings_list:
>  
>  	human-readable list of cpuX's hardware threads within the same
>  	drawer_id.
>  
> -To implement it in an architecture-neutral way, a new source file,
> -drivers/base/topology.c, is to export the 6 to 12 attributes. The book
> -and drawer related sysfs files will only be created if CONFIG_SCHED_BOOK
> -and CONFIG_SCHED_DRAWER are selected.
> +Architecture-neutral, drivers/base/topology.c, exports these attributes.
> +However, the book and drawer related sysfs files will only be created if
> +CONFIG_SCHED_BOOK and CONFIG_SCHED_DRAWER are selected, respectively.
>  
>  CONFIG_SCHED_BOOK and CONFIG_DRAWER are currently only used on s390, where

fwiw:                    CONFIG_SCHED_DRAWER

>  they reflect the cpu and cache hierarchy.


-- 
~Randy
