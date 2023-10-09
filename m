Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A94E95A8E
	for <linux-doc@archiver.kernel.org>; Mon,  9 Oct 2023 09:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345860AbjJIJrl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345758AbjJIJrk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 05:47:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F918F
        for <linux-doc@vger.kernel.org>; Mon,  9 Oct 2023 02:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696844857; x=1728380857;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Yot1gWjS+FuI/8Qzw4Kqz+fbdvEYirBsShQdLmuNUac=;
  b=JUQJe604DW/LxcnnW+MANE3Kk4Gi8LpsHWo7cuEi7GJeIVDIcbdsIsiw
   mMhMlDq75OwSj/FQgwZOEphDCW+8NbLO/Vcv0LmAbbWdhdpOCkP7RLE5o
   AfZNyyz51ba+0ifADm10QYlU+lcSBZjV+LFCicjRPJQm6/Mhlb3BujWwn
   TT6QxYdbNy40jk8sKj+QY5CYC1RQYj+WHeH6pxDJ+J7WRm9QQHjmL+tLA
   tmqKiM5NzZ9YvN8+Ik9MoeOUlG7rPPVViRzpPQGeFeMypygZcFgFZZJJr
   HxP91AnKjxYe08Vw27ItBJ8ZKEnMZ+KQW1zp6dANY0hPXIusegNTVPX80
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="364398290"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="364398290"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 02:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="876742424"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="876742424"
Received: from eboyarsk-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.41])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 02:47:34 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Matthew Wilcox <willy@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Carlos Bilbao <carlos.bilbao@amd.com>
Subject: Re: [PATCH] doc: Always check kernel-doc
In-Reply-To: <ZSDXGgofqj+9l16e@casper.infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230817144142.903553-1-willy@infradead.org>
 <87cyzkmh26.fsf@meer.lwn.net> <ZN+m9Bb7P+uH/TN8@casper.infradead.org>
 <CAK7LNARKv_HGsF3r076u+G1ia645stimnoYc93CQ-9_3wvBe5w@mail.gmail.com>
 <ZSDXGgofqj+9l16e@casper.infradead.org>
Date:   Mon, 09 Oct 2023 12:47:31 +0300
Message-ID: <87fs2k6sb0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 07 Oct 2023, Matthew Wilcox <willy@infradead.org> wrote:
> Can we have a way to enable kernel-doc coverage on a per-directory basis?
> It will stop us from regressing.  I got mm/ down to zero warnings, and
> that promptly regressed.  If we force kernel-doc to run on files under
> mm/, developers will notice breakage quickly.

It's not exactly pretty, but we do this in i915. Unfortunately, it needs
to be done separately and in different ways for kernel-doc in .c and .h.

Check out drivers/gpu/drm/i915/Makefile for ideas.

BR,
Jani.

-- 
Jani Nikula, Intel
