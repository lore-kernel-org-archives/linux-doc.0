Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F32E7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 10:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfAGK1V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 05:27:21 -0500
Received: from mga11.intel.com ([192.55.52.93]:35367 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbfAGK1U (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Jan 2019 05:27:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2019 02:27:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,450,1539673200"; 
   d="scan'208";a="135975274"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.72.79])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2019 02:27:18 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Bart Van Assche <bvanassche@acm.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Joe Perches <joe@perches.com>, Zhang Le <r0bertz@gentoo.org>,
        Li Yang <leo@zh-kernel.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into .dir-locals.el
In-Reply-To: <1546620035.163063.42.camel@acm.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190104003957.82220-1-bvanassche@acm.org> <4009470.9o5kGc7Prg@harkonnen> <87k1jk8ycd.fsf@intel.com> <1546620035.163063.42.camel@acm.org>
Date:   Mon, 07 Jan 2019 12:29:02 +0200
Message-ID: <878szw92xd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 04 Jan 2019, Bart Van Assche <bvanassche@acm.org> wrote:
> Regarding users having their own version of .dir-locals.el: why do you
> think anyone would want to do that?

Err, .dir-locals.el is not only for a project to enforce local variables
on emacs users, it's also for the users to set local variables for the
project.

> Anyway, if anyone wants to replace that file they can provide a
> .dir-locals-2.el file.

It does not replace anything, it's loaded in addition to .dir-locals.el.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
