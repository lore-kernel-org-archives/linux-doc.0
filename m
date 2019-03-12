Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4056F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Mar 2019 07:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfCLH5d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Mar 2019 03:57:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:15017 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbfCLH5d (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Mar 2019 03:57:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2019 00:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,470,1544515200"; 
   d="scan'208";a="154205965"
Received: from hkrasnod-mobl.ger.corp.intel.com (HELO localhost) ([10.252.62.84])
  by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2019 00:57:31 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
        "Tobin C. Harding" <me@tobin.cc>, linux-doc@vger.kernel.org
Subject: Re: undefined label
In-Reply-To: <20190311113015.166262c9@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190307091734.GB9152@eros.localdomain> <c24a75bf-5bd5-aca8-7764-e05a03495e01@darmarit.de> <20190307203041.GC21937@eros.localdomain> <f0891518-ae90-904b-1001-477c122f1abb@darmarit.de> <878sxp7e6s.fsf@intel.com> <20190311113015.166262c9@lwn.net>
Date:   Tue, 12 Mar 2019 09:57:30 +0200
Message-ID: <874l88frth.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 11 Mar 2019, Jonathan Corbet <corbet@lwn.net> wrote:
> On Fri, 08 Mar 2019 14:17:47 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> >  >> To close such cross-books links we can use intersphinx [1] and map to e.g.
>> >  >>
>> >  >>    intersphinx_mapping = {
>> >  >>        'kernel': ('https://www.kernel.org/doc/html/latest/', None)}  
>> >
>> > This requires online access while building the output.  Anyway, as soon as
>> > I have some time to spare I will send a RFC with more explanation about
>> > (you will receive it in CC).  
>> 
>> Please remember to call out the online access in the patch series. Such
>> a requirement is going to draw a lot of opposition.
>
> Indeed, I think that would a difficult requirement to add.  It may well be
> better, in the end, to simply document this "feature" and live with it.

Apparently it's also possible to have a local intersphinx mapping file
which could be committed to git [1]. That obviously needs to be manually
updated occasionally, which is a bit tedious.

IIUC intersphinx also means that if a cross-reference target is not
present in the documentation being built, it'll use the canonical URL in
the intersphinx_mapping. So your locally built documentation for a
sub-book might contain links to kernel.org. I'm not sure whether that's
better or worse than broken links.

BR,
Jani.


[1] https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html#confval-intersphinx_mapping


-- 
Jani Nikula, Intel Open Source Graphics Center
