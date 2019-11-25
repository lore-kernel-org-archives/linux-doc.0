Return-Path: <SRS0=z7gB=ZR=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4671C432C0
	for <linux-doc@archiver.kernel.org>; Mon, 25 Nov 2019 04:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 608FE2071A
	for <linux-doc@archiver.kernel.org>; Mon, 25 Nov 2019 04:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=generalsoftwareinc-com.20150623.gappssmtp.com header.i=@generalsoftwareinc-com.20150623.gappssmtp.com header.b="fuSHOk3a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKYEhm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Nov 2019 23:37:42 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:33543 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfKYEhl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Nov 2019 23:37:41 -0500
Received: by mail-ua1-f47.google.com with SMTP id a13so3977833uaq.0
        for <linux-doc@vger.kernel.org>; Sun, 24 Nov 2019 20:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=bwQqTlKTDKZ2abMdWNVOtZUSwtWKOhRAhvsBA2Mpx5I=;
        b=fuSHOk3aA1DgmMXAvf4yqAMpCZDfU7RBqCAM75G5MmJd4jFAgJCnJE47ohYW1tHmLz
         5j+TwUBSQOFIKh8KtzBPOoDXoXX1RihAxy+aX7++qKTaow5CrgUpwI011hDmJJp0Vg+d
         8YdM+6vl3Tpm9OdOYFNTuqm+nVN86o1o9BoEpReo63f5wTUcuAMAdwsLS2sTNprVdrSc
         VjnE4HdyNbXt53tfgnXTwgPO3HEqzjCxhPv9DMk9zyvcRsu2R6UZ8119F21J3wqKez6G
         BfgbTPYGpKCem7op6F/boQiT9U24OKtuvSHXLduew/l/zcmczv9aIbE3zEBM4xQ6i9ib
         ncsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=bwQqTlKTDKZ2abMdWNVOtZUSwtWKOhRAhvsBA2Mpx5I=;
        b=KPthS7o9vDMKZjAHnTZzVi8CiuFd/B35rMriJLWk4YNe8kjSrzleqCF+BLybXMJ7ES
         5kaPz2uGLCRRDUTVa9L2Wikmkg/31m9V8fmmDlblOPZwgNQQVDUPnKFQe8/iNnSbQxAY
         S2Ht9czQr6YR/RLJ676/B9G+0xfW7G/sB3GaG0LZQKDJ2v3Qotjfvif8S5avTMY4wNgD
         FUL1EriDm08pnVtQuk12CBpUuJvnaUZkd16Cc7iTG5uT07C3m9pFURgEha4YzAsO8nbM
         Rz5AOZGK18RRdxXMMECAzcdqKeBY/it/a+CVlS6hC3uaPvBXUayz0P2rVcHhqMa0WPBf
         9dyg==
X-Gm-Message-State: APjAAAUBAWplMMkdSjEEEyo9KnBJMEsst6plxcT9f1MOcKT9EAcfsieg
        FxfLtDvqWSkTR2Co2k4V+vl0pg==
X-Google-Smtp-Source: APXvYqyYfS/umk3C9WJ6m+ltXeTQDzU2ehX1ACDpitE/Nf9SkmILFLc9ZOhVD6PuLqh3XC73KE78QA==
X-Received: by 2002:ab0:49e9:: with SMTP id f38mr16314359uad.71.1574656659044;
        Sun, 24 Nov 2019 20:37:39 -0800 (PST)
Received: from ubuntu1804-desktop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id r64sm1818020vkd.9.2019.11.24.20.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 20:37:38 -0800 (PST)
Date:   Sun, 24 Nov 2019 23:37:37 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     joel@joelfernandes.org, saiprakash.ranjan@codeaurora.org
Subject: [RFC v2 0/2] docs: ftrace: Clarify the RAM impact of buffer_size_kb
Message-ID: <cover.1574655670.git.frank@generalsoftwareinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Clarifies the RAM footprint of buffer_size_kb without getting into
implementation details.

Changes in v2:
  - Removes implementation description of the RAM footprint of
    buffer_size_kb, but still make the corresponded clarification.

  - Removes a patch that was just for illustration purposes because
    Steven already got the issue that I was referring to.

  - Adds a patch to fix other typos in the doc.

Frank A. Cancio Bello (2):
  docs: ftrace: Clarify the RAM impact of buffer_size_kb
  docs: ftrace: Fix typos

 Documentation/trace/ftrace.rst             | 9 +++++----
 Documentation/trace/ring-buffer-design.txt | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.17.1

