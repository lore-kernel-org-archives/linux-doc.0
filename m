Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E82FA7D062
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 20:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932568AbeFGUyb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 16:54:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:41228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932512AbeFGUya (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 16:54:30 -0400
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CC8A208A6
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 20:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528404869;
        bh=gZqvDyTiIXVTFOWHjmKSy3cvdqggFCpFqWhSS5zfKGk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g0FKEzr9SXgKkm8aOaTmcEU8w+QVKODvIIS6eQx9qVbmyd6jq84GTBiK+Po+gtiMh
         Qa05Tnd2vJ6t4H3Hp9bst1lhcvPS0uUODZEduFRw1OAoKGq83Vsak/FIHtnueddpkK
         FF9/A2aFMVysHqh5+u2IM5vISOF/iiWNOUFfm+ZE=
Received: by mail-wm0-f54.google.com with SMTP id j15-v6so21923055wme.0
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 13:54:29 -0700 (PDT)
X-Gm-Message-State: APt69E0Zi7r0N1Gdx1iwMaETZDwbxcKr7k6FV+SpGBLMJ1f0Qkc0h4fB
        9awu90DGXCh6TsH8nADF+GJv1IR9J/VNeZtjW/H0cQ==
X-Google-Smtp-Source: ADUXVKK29Zb7ztvSpMtp1mxhqVazOzUoVdE9DJQD1mXwtjA6pVLzfnCniIup3+uxsR2OIeITDX7rcbLt9NJQOMbjWCI=
X-Received: by 2002:a1c:b947:: with SMTP id j68-v6mr2479649wmf.144.1528404868084;
 Thu, 07 Jun 2018 13:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com> <20180607143807.3611-10-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143807.3611-10-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 13:54:16 -0700
X-Gmail-Original-Message-ID: <CALCETrU8fK1j=H_9xpJrrCSUTcadb8dfjJX-YZwiWDZZFmLxRQ@mail.gmail.com>
Message-ID: <CALCETrU8fK1j=H_9xpJrrCSUTcadb8dfjJX-YZwiWDZZFmLxRQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] mm: Prevent madvise from changing shadow stack
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
>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Seems reasonable to me.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
