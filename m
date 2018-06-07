Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4F8297DF8D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 15:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934782AbeFGPjv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 11:39:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:45576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933959AbeFGPjt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 11:39:49 -0400
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com [209.85.214.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D77F3208A0
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528385989;
        bh=K2K5f4TU+IqqOaLG++7PxVszhXQtKYnAib863khdimA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Lr6oDplmxf6h6sSP/Cenc8BVqVCxWHCpqTS+qUtd9Cq9SJ643wWNax800p6XkiYai
         fzvna3tvkxeO6BT38LFDBqejQCNTUZefo9IRCgfuS191UZ8z17e83pnAJ5IuNJh9j1
         UFm8KCo8DhrRbIEqkgKt4kVUpvNf/VfTJzKFjdJA=
Received: by mail-it0-f54.google.com with SMTP id a3-v6so13227251itd.0
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 08:39:48 -0700 (PDT)
X-Gm-Message-State: APt69E2wprEZJLs6g+nm+8c1kDhJaByrhZJhyfAltvqahMJzvLMaXZF5
        YQ2CNc9Ol2YO4xXVZIbtXmbkwwLSrOx8lUi/XEkgGA==
X-Google-Smtp-Source: ADUXVKJeifGxClWetEM14/uRDJdyI4tiKA7zyhthdXd4HZZ2lsGQzaczi/gUmlgMw+fldU/kCvnK//FTEt253c9gKh8=
X-Received: by 2002:a24:490:: with SMTP id 138-v6mr2557373itb.95.1528385988301;
 Thu, 07 Jun 2018 08:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143544.3477-1-yu-cheng.yu@intel.com> <20180607143544.3477-6-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143544.3477-6-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 08:39:36 -0700
X-Gmail-Original-Message-ID: <CALCETrWVZfWUSOy6wRyVBfP2b2TzZuPt8bCe6q0Pa5r7onO+VA@mail.gmail.com>
Message-ID: <CALCETrWVZfWUSOy6wRyVBfP2b2TzZuPt8bCe6q0Pa5r7onO+VA@mail.gmail.com>
Subject: Re: [PATCH 5/5] Documentation/x86: Add CET description
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 7, 2018 at 7:40 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:

Fix the subject line, please.  This is more than just docs.

>
> Explain how CET works and the noshstk/noibt kernel parameters.

Maybe no_cet_shstk and no_cet_ibt?  noshstk sounds like gibberish and
people might need a reminder.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
