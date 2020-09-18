Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8D6C43463
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 17:19:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B69F21707
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 17:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgIRRTU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:19:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:35334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgIRRTU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 Sep 2020 13:19:20 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85D8921707;
        Fri, 18 Sep 2020 17:19:19 +0000 (UTC)
Date:   Fri, 18 Sep 2020 13:19:17 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: [PATCH v3 2/2] docs: trace: ring-buffer-design.rst: use the new
 SPDX tag
Message-ID: <20200918131917.13d9f570@gandalf.local.home>
In-Reply-To: <dbc9bd9ab30c6862e465343239e82102cbdc0f39.1599628249.git.mchehab+huawei@kernel.org>
References: <cover.1599628249.git.mchehab+huawei@kernel.org>
        <dbc9bd9ab30c6862e465343239e82102cbdc0f39.1599628249.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  9 Sep 2020 07:14:33 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> SPDX v3.10 gained support for GFDL-1.2 with no invariant sections:
> 
> 	https://spdx.org/licenses/GFDL-1.2-no-invariants-only.html
> 
> Let's use it, instead of keeping a license text for this file.

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
