Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9F5187D071
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 11:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752117AbeENLBB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 07:01:01 -0400
Received: from mga17.intel.com ([192.55.52.151]:35893 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752086AbeENLBB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 May 2018 07:01:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 May 2018 04:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,399,1520924400"; 
   d="scan'208";a="54989652"
Received: from jnikula-mobl2.fi.intel.com (HELO localhost) ([10.237.72.62])
  by fmsmga001.fm.intel.com with ESMTP; 14 May 2018 04:00:56 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 1/2] scripts/kernel-doc: Auto-detect common code-blocks
In-Reply-To: <20180510105105.5cb0d54f@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <2ac6e3da22119f714406925139e40f4d835d11a4.1525962971.git.mchehab+samsung@kernel.org> <20180510163456.GC30442@bombadil.infradead.org> <20180510105105.5cb0d54f@lwn.net>
Date:   Mon, 14 May 2018 14:03:33 +0300
Message-ID: <87in7q33ei.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 May 2018, Jonathan Corbet <corbet@lwn.net> wrote:
> On Thu, 10 May 2018 09:34:56 -0700
> Matthew Wilcox <willy@infradead.org> wrote:
>
>> I think this is a bit fragile.  Why not just search for ':\n'?  Is
>> there ever a case where we want to write:
>> 
>> /**
>>  * foo is a bar:
>>  * wibble
>>  */
>> and have wibble not be a code-block?
>
> Yeah, we might want to write something like:
>
>  - Leading off a bulleted list
>
>  1) or a numbered list
>
> for example.  That's why I was thinking of looking for explicit markers
> for such lists.
>
> It'll take some playing around with to have a hope of getting right,
> methinks.

We had serious trouble with the old DocBook toolchain because the tool
pipeline was so long, and each step had its own expectations and quirks.
For example, remember the escaping needed for xml in kernel-doc? Or tmpl
xml files being invalid xml because of the docproc directives? One of
the big benefits of the current toolchain is minimizing the amount of
special casing magic required.

The more we add custom syntax sugar in kernel-doc, the more we run the
risk of running into hard problems later on in the Sphinx phase. For
example, our own syntax preventing the use of legitimate rst syntax. And
now we get somewhat reasonable error messages from Sphinx when things go
wrong; we didn't get that when the impedance mismatches caused issues
with the old toolchain. They were hard to debug and mostly nobody even
bothered. We should work to reduce the amount of special processing in
kernel-doc, not the other way round.

The use of "::" is a valid and arguably rather non-invasive rst token
for indicating the following indented block is a literal block. Adding
heuristics (especially ones based on English language magic words) will
lead to bigger problems than it's trying to solve.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
