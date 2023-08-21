Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE83EE4993
	for <linux-doc@archiver.kernel.org>; Mon, 21 Aug 2023 09:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbjHUJST (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Aug 2023 05:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjHUJSS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Aug 2023 05:18:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C074C4
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692609497; x=1724145497;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=50GMRPYH7p1TVk638yp/q+eo8/RzlT//jwRoo1wxTR4=;
  b=VMBuvDX0awXZYSToB+czdi4ZV2JdWNOc78a2Gs3TOKiFnySOSko/k1dD
   Xd8aQtAKLrbTM7Fb8eDC94eAXzdNDKdpTKNJwl8YCF98tQcWaitrb85R3
   eesLLwWSTDkBJu4TOzE3M8N1k+obpaClN+GQaUyNfC6KQglCqS7NGhY8z
   P/kiZBCrChvRehdT2+uHrJOeWRndoX3M5M0ItvKxKetyDihRr4z2nStsG
   Xzv6ZJwSSlRZftdjmeR9F30r4c4eCxKvIqf8a3SGNH3hj4F4t1ZZT3sBZ
   BVPgvcJZAtuRQLSr17Otj5bPvzmJUXzD6QDG61zAvu+8c1uSs2TK4yQy0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="373509764"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="373509764"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 02:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="879448058"
Received: from hpabst-mobl.ger.corp.intel.com (HELO localhost) ([10.252.54.190])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 02:18:19 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Matthew Wilcox <willy@infradead.org>, mail@renenyffenegger.ch
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] DOCUMENTATION: Correct filename in Documentation
In-Reply-To: <ZN6NUPTCYaRPmSCZ@casper.infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230817205940.7477-1-mail@renenyffenegger.ch>
 <ZN6NUPTCYaRPmSCZ@casper.infradead.org>
Date:   Mon, 21 Aug 2023 12:18:12 +0300
Message-ID: <87r0nw7nzf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Aug 2023, Matthew Wilcox <willy@infradead.org> wrote:
> On Thu, Aug 17, 2023 at 10:59:40PM +0200, mail@renenyffenegger.ch wrote:
>> Correct filename of renamed file in Documentation
>> 
>> The current documentation in Documentation/core-api/kobject.rst refers to a
>> macro named `container_of`, supposedly defined in linux/kernel.h while in
>> reality it is defined in linux/container_of.h
>
> Maybe we should just remove the reference to where it's defined?

container_of.h seems to have kernel-doc, but it's not included anywhere
in Documentation. With that fixed, this could be a reference to the
documentation.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
