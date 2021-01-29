Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA90C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 11:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EE4E65063
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 11:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhA2L5L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Jan 2021 06:57:11 -0500
Received: from mga02.intel.com ([134.134.136.20]:47399 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232310AbhA2L42 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 29 Jan 2021 06:56:28 -0500
IronPort-SDR: IEoyhOTRoFx7+fN18ogqjn4ckqH1LOEhAhnnr1Qhmz7UHwfLSssu/7pic6+y3KltUVx33hbPwh
 mdrFKQ5eBUnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="167509120"
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="167509120"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 03:51:24 -0800
IronPort-SDR: uiUyYhj0Vj7ZV5ATswDGZyRfkQlpDmCtvwWJGdkTm+yvlr6XrnX6/WDx+u9lf+U3/28PW3dw3J
 LUNcNnrhljXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="410229328"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2021 03:51:23 -0800
Received: from [10.249.146.241] (mwajdecz-mobl.ger.corp.intel.com [10.249.146.241])
        by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 10TBpMOD007796;
        Fri, 29 Jan 2021 11:51:22 GMT
Subject: Re: [PATCH] scripts/kernel-doc: add internal hyperlink to DOC:
 sections
To:     Jani Nikula <jani.nikula@intel.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
References: <20210118110813.1490-1-michal.wajdeczko@intel.com>
 <20210128163949.1f07186b@lwn.net> <87mtwshxjm.fsf@intel.com>
From:   Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <42db85f8-3aa2-113e-ab38-7eac96edbf6a@intel.com>
Date:   Fri, 29 Jan 2021 12:51:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87mtwshxjm.fsf@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 29.01.2021 11:01, Jani Nikula wrote:
> On Thu, 28 Jan 2021, Jonathan Corbet <corbet@lwn.net> wrote:
>> On Mon, 18 Jan 2021 12:08:13 +0100
>> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>>
>>> While DOC: section titles are not converted into RST headings
>>> sections and are only decorated with strong emphasis markup,
>>> nothing stops us from generating internal hyperlinks for them,
>>> to mimic implicit hyperlinks to RST headings.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>>
>> So I've applied this, but ...
>>
>>>  scripts/kernel-doc | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>>> index 6325bec3f66f..272f70c9fb13 100755
>>> --- a/scripts/kernel-doc
>>> +++ b/scripts/kernel-doc
>>> @@ -833,6 +833,7 @@ sub output_blockhead_rst(%) {
>>>  	next if (defined($nosymbol_table{$section}));
>>>  
>>>  	if ($output_selection != OUTPUT_INCLUDE) {
>>> +	    print ".. _$section:\n\n";
>>>  	    print "**$section**\n\n";
>>>  	}
>>
>> ...the placement within this if means that the section marker doesn't
>> appear whenever a doc block is explicitly included with the :doc: modifier
>> - which I think is much of the time.  I *think* the marker should be
>> output unconditionally.
>>
>> Jani, you appear to be the culprit behind that particular "if", which
>> seems a little questionable to me in general at the moment, but you must
>> have had a good reason.  Do you see any reason why a section marker should
>> be suppressed in the same way?
> 
> ISTR there were a lot of explicit doc block inclusion where the .rst
> file already had a section heading, so this would have lead to double
> heading. (Specifically, actual heading from rst, followed by a bolded
> line from the doc comment title.)
> 
> Turning the doc comment title into an actual heading would require
> knowing the surrounding heading level i.e. which underline character to
> use. This could be done by passing the character to kernel-doc with the
> directive, and omitting the heading in the .rst, but this in turn makes
> the .rst less readable as plain text because you lose the structure.
> 
> It's not perfect, but I'm not sure what the right fix to that should be.
> 
> As to the patch at hand, it does seem like moving the hyperlink target
> outside of the if block here is the right thing to do. We'll want the
> targets to work regardless of how the doc comment is included. I'd seen
> Michal's patch before, but didn't think of this at the time.

The problem is that in majority of cases where we have explicit heading
in .rst file, the same name is used as DOC: title. If we unconditionally
add target for every DOC: title, then Sphinx will complain with:

"WARNING: Duplicate target name, cannot be used as a unique reference"

and render documentation with non-working cross references.

AFAIK, this patch as-is does not introduce any new warning.

Thanks,
Michal
