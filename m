Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A76A7D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 11:17:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfADLRT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 06:17:19 -0500
Received: from mga04.intel.com ([192.55.52.120]:13931 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbfADLRS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jan 2019 06:17:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jan 2019 03:17:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,438,1539673200"; 
   d="scan'208";a="135286177"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.72.61])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2019 03:17:15 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Joe Perches <joe@perches.com>, Zhang Le <r0bertz@gentoo.org>,
        Li Yang <leo@zh-kernel.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into .dir-locals.el
In-Reply-To: <4009470.9o5kGc7Prg@harkonnen>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190104003957.82220-1-bvanassche@acm.org> <4009470.9o5kGc7Prg@harkonnen>
Date:   Fri, 04 Jan 2019 13:18:58 +0200
Message-ID: <87k1jk8ycd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 04 Jan 2019, Federico Vaga <federico.vaga@vaga.pv.it> wrote:
> Isn't it better if we collect such configuration files into a
> dedicated directory (where exactly?) instead of putting them in the
> top-level one? Then, the developer has to copy/link the configuration
> file into the top-level directory.
>
> If we accept emacs configuration files in the top-level directory we
> will have to accept also the ones from other editors (of course, when
> they support local configurations). In addition, probably, there are
> people who do not want to use local configurations.

Fully agreed.

Also, you probably do not wish the file to change when you switch
branches with different upstream baselines. Or deal with possible emacs
version dependent changes. I do like having the example in the kernel
tree, but let the users deal with actually using the file. Placing the
file at the top level makes it harder for users to have a file of their
own there. This from an emacs user.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
