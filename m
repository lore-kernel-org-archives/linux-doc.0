Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FE1C43460
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 16:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26EE26052B
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 16:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345434AbhEQQVa convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 12:21:30 -0400
Received: from mga05.intel.com ([192.55.52.43]:52983 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345781AbhEQQUo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 12:20:44 -0400
IronPort-SDR: kmU6xCnCNKl9vJX0xQFN73tsR3zkzrUV40Uy5IqPIT4OJoSITHW638R3ETA1bVYdU+HekrDunW
 6G4rmtCcerPA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="286031446"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="286031446"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 09:11:37 -0700
IronPort-SDR: 4uRZisQkY0v1wgg3I9c0I+LCJefuPBxXQnE5aPdODni2uP7snwEmunJ27rT0KY3XO3oLyjGPg9
 7I1d9/xoyJSw==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="438977527"
Received: from jbrandeb-mobl4.amr.corp.intel.com (HELO localhost) ([10.212.212.39])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 09:11:37 -0700
Date:   Mon, 17 May 2021 09:11:36 -0700
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v3 11/16] docs: networking: device_drivers: replace some
 characters
Message-ID: <20210517091136.00000e96@intel.com>
In-Reply-To: <23247f10ab58ae1b54ac368f8a2d2769562adcf4.1621159997.git.mchehab+huawei@kernel.org>
References: <cover.1621159997.git.mchehab+huawei@kernel.org>
        <23247f10ab58ae1b54ac368f8a2d2769562adcf4.1621159997.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.12.0 (GTK+ 2.24.28; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab wrote:

> The conversion tools used during DocBook/LaTeX/html/Markdown->ReST
> conversion and some cut-and-pasted text contain some characters that
> aren't easily reachable on standard keyboards and/or could cause
> troubles when parsed by the documentation build system.
> 
> Replace the occurences of the following characters:
> 
> 	- U+00a0 (' '): NO-BREAK SPACE
> 	  as it can cause lines being truncated on PDF output
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

For the Intel Ethernet Docs, LGTM!

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
