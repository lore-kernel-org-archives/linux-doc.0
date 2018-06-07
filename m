Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FEE37D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 18:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932430AbeFGSuZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 14:50:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:37104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932373AbeFGSuY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 14:50:24 -0400
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D683A2089C
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 18:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528397424;
        bh=DSpF0YzzhmUXYwyh9RmNB6WdmHLyUNES3xduCMDylXE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Zb1bPCajgPlDODF+UxSkNAJtIiUe6rIrhyLaDhNsnnjSTLmoF/bttDfHb9zEgxI0Y
         HBZXs/INMU/E2sUyOrNPpcsdTzSWNO/QAxdPPfczq4stKjebXK8YclNJjX7fFGQl6n
         MchJBMmPcC7ih/6CnLcEQttGiBnw2VXBIliKvL+w=
Received: by mail-wm0-f53.google.com with SMTP id e16-v6so19781281wmd.0
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 11:50:23 -0700 (PDT)
X-Gm-Message-State: APt69E2NhcS9IrTL9dvfb8E/KWXpwMGiKLg4F6YJKMS8vL/MkutyrOes
        2u3OYylZXPHHcwG2pPxcVSa+ey+TPd5Wj9wGtCvMOg==
X-Google-Smtp-Source: ADUXVKKTFWpBTa5nDXjvC7B+SPBsLZukJspBBFwYRo6krt2G6R9OdfrgMbAmwnIc8IyKmUh32jqq3x+4f9gKkoHTlxI=
X-Received: by 2002:a1c:34c9:: with SMTP id b192-v6mr2536456wma.21.1528397422410;
 Thu, 07 Jun 2018 11:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com> <20180607143807.3611-11-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143807.3611-11-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 11:50:10 -0700
X-Gmail-Original-Message-ID: <CALCETrXTyXYCDJxbCA+cbzZirmMKRQq8XSS4+Lyeo_QMywdxFw@mail.gmail.com>
Message-ID: <CALCETrXTyXYCDJxbCA+cbzZirmMKRQq8XSS4+Lyeo_QMywdxFw@mail.gmail.com>
Subject: Re: [PATCH 10/10] mm: Prevent munmap and remap_file_pages of shadow stack
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

On Thu, Jun 7, 2018 at 7:41 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:

blocking remap_file_pages() seems reasonable.  I'm not sure what's
wrong with munmap().
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
