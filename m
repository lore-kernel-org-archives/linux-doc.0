Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710E7C6FA82
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 08:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbiIWIKW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 04:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiIWIKW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 04:10:22 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BBE108081;
        Fri, 23 Sep 2022 01:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663920620; x=1695456620;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=wbH0r5c//ruJs6KanqbGDo6O5zuHina9rhNzoAQJT10=;
  b=Zuy9AvvKCKQ58BBdCJc26oxEnbgMbTaT8XXoTATks/5p7SfU+ViUiAFV
   o8jaAvHPQimdAyBrpL5OLVFc9xfi7ceKgeDOmmaxFln6Mm/WJwDX1fm/G
   mpLcAVo/pXdXtIDNUcndjfu8tnH8fnctoc81qyiIu6LU82R9MQ9nxLeMX
   yeyqR4F01aDI1PYfJdYzTvP6BnMetlpqRBzfoZpIjNQv01aJPsSvvWVrf
   PEBO5otfdrCWJbKrCn/B9qafRVnOBccBfrfmNrG4T5XtqspIETnGgD6VN
   IjbW2wGiWu1NcecWXIFtAgOdAI8EMgWpPY1odqckvPPBhDkmGDgxHeMBK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="364556849"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="364556849"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 01:10:19 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="653320190"
Received: from armannov-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.61.93])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 01:10:17 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 0/4] Rewrite the top-level index.rst
In-Reply-To: <20220922204138.153146-1-corbet@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220922204138.153146-1-corbet@lwn.net>
Date:   Fri, 23 Sep 2022 11:09:59 +0300
Message-ID: <87r1024ilk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 22 Sep 2022, Jonathan Corbet <corbet@lwn.net> wrote:
> Unless I get screams I plan to slip this into 6.1.  It is definitely not
> the final form of the front page, but I doubt we'll ever get there; we can
> change it in whatever ways make sense.

I'm screaming for you to merge it already! It's a great stride forward.

FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>

-- 
Jani Nikula, Intel Open Source Graphics Center
