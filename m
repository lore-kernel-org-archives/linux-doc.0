Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 276827D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 12:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfCHMRu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Mar 2019 07:17:50 -0500
Received: from mga14.intel.com ([192.55.52.115]:2244 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726286AbfCHMRu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Mar 2019 07:17:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Mar 2019 04:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; 
   d="scan'208";a="153221075"
Received: from kumarjai-mobl.ger.corp.intel.com (HELO localhost) ([10.252.42.2])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2019 04:17:48 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Markus Heiser <markus.heiser@darmarit.de>,
        "Tobin C. Harding" <me@tobin.cc>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: undefined label
In-Reply-To: <f0891518-ae90-904b-1001-477c122f1abb@darmarit.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190307091734.GB9152@eros.localdomain> <c24a75bf-5bd5-aca8-7764-e05a03495e01@darmarit.de> <20190307203041.GC21937@eros.localdomain> <f0891518-ae90-904b-1001-477c122f1abb@darmarit.de>
Date:   Fri, 08 Mar 2019 14:17:47 +0200
Message-ID: <878sxp7e6s.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 08 Mar 2019, Markus Heiser <markus.heiser@darmarit.de> wrote:
> Hi Tobin,
>
> Am 07.03.19 um 21:30 schrieb Tobin C. Harding:
>> On Thu, Mar 07, 2019 at 10:58:07AM +0100, Markus Heiser wrote:
> [...]
>>> If there is any interest in, I can implement a RFC for this.
>> 
>> Cool!  I think this would be super useful, I for one like using
>> SPHINXDIRS when developing docs incrementally so removing false warnings
>> would be nice.  I doubt I'm the only one to be baffled about Sphinx
>> references.  I'd be happy to review and test your RFC if you CC me.
>
> Intersphinx has also drawbacks. E.g.:
>
>  >> To close such cross-books links we can use intersphinx [1] and map to e.g.
>  >>
>  >>    intersphinx_mapping = {
>  >>        'kernel': ('https://www.kernel.org/doc/html/latest/', None)}
>
> This requires online access while building the output.  Anyway, as soon as
> I have some time to spare I will send a RFC with more explanation about
> (you will receive it in CC).

Please remember to call out the online access in the patch series. Such
a requirement is going to draw a lot of opposition.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
