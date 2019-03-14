Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 19F977D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Mar 2019 18:53:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfCNSx3 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Mar 2019 14:53:29 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33990 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbfCNSx3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Mar 2019 14:53:29 -0400
Received: by mail-ot1-f67.google.com with SMTP id r19so6134606otn.1;
        Thu, 14 Mar 2019 11:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BD3Z4nlDPQfDqM3xryj6ykCX87Ua89Ea2eGXjl2k0eM=;
        b=G1ur8oXz6+joIxcQ9LUZ61lpShJHvMjYiUJKHoyJxt5eQ0p9TBb19IjnLvOvdS/5Hv
         3+uUg8mg4x4KrOQDjvWzGmyfih0ysp7eSshIqZQgEnWmzPF5isXjKm2IHNUSVkFsDD+0
         flslBs1pXEtVQmu5glvxEYoEbLDMKeAqmExWvnZb92JnkS+pae+HvugHBkuBVZtsWnV0
         S+0T3x0h4xNa4Rw23fzwu1paZcRNN9fw8cOkFDjZ0Ky6F11GT3Ie0+x0JOMtUdiuANwV
         CdTzAdN8GVe6FvbCGEMb+Qzi0nibpCrnkGpUbRzlHCSlM3B0scJiZM+LiCYIZsWNBfKy
         e8YQ==
X-Gm-Message-State: APjAAAV/lNYFmtpxIKzma3oc8kKPHcIdKfJ7Q5WIX+JfWPKsHEBTtdYI
        sKRiFhH/G6tNEhntRF3hKcilAQS9xGIgctNK7Ks=
X-Google-Smtp-Source: APXvYqzOKT+oCI5wQYNxpeIL1McDYMexGCpy76T6dTLQRweuBl8sC7e5yMyCCZP8pSDHmf7yA8ldPxMnITkKs0cqmq4=
X-Received: by 2002:a9d:7143:: with SMTP id y3mr1988558otj.12.1552589608707;
 Thu, 14 Mar 2019 11:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190311150423.15979-1-ross.philipson@oracle.com>
 <20190311150423.15979-2-ross.philipson@oracle.com> <018B6986-0C7F-4C76-88ED-1548BC77E5AA@zytor.com>
In-Reply-To: <018B6986-0C7F-4C76-88ED-1548BC77E5AA@zytor.com>
From:   Konrad Rzeszutek Wilk <konrad@kernel.org>
Date:   Thu, 14 Mar 2019 14:53:18 -0400
Message-ID: <CACJDEmpKxL=c-1zeBYR6v4JK=QN3vxd967HwBFHhTWmxPQhM4A@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86: Secure Launch boot protocol
To:     "H. Peter Anvin" <hpa@zytor.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        X86 <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        corbet@lwn.net, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        kanth.ghatraju@oracle.com, Daniel Kiper <daniel.kiper@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        dpsmith@apertussolutions.com,
        Ross John Philipson <ross.philipson@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

.. snip..
>
> Double NAK – I'm in a meeting right now but with clarify shortly.

Would it help if we had a meeting to brainstorm an acceptable solution?
Thank you.
