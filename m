Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B4FCD80BA
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 12:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbjJJMEI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbjJJMD4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 08:03:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3DE111
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 05:03:38 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9a645e54806so937368066b.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696939417; x=1697544217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX4yc2ifCmuKqzHMK3MHccD28II4Dp4X6ioalprFaxs=;
        b=P5Iiy9rIgxM97RNUnHMcq4ImDNVmKhD0re8PMyKXUGurBlTFCZTHrWdCTp8XImKjYJ
         l/luJtEbpgN+OeTd+OTmu/UPIZrwapBk02IQTGhA8qM4/+0mjdpq5FvPDM9JgNbJf6ru
         XTCmJUADGxAE7cIDh3fLuM+SQzuNuAiJWnvL0PkeJacyyPcTBSI7h8Z9HIcMSrDb5tQ4
         JP7J1ThlgVYO6UfeR5q8I4KZZa19T4kF4UxszG/kFhbY0cVn0OxvRsY/nlFFAa8hKf4F
         TDrztpl54FA/+VGhDBuMuQ+APAYc+GU/UBbvsMmPMk9VuvzHz2cCNtNVXhfTzSr8psIx
         CMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939417; x=1697544217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX4yc2ifCmuKqzHMK3MHccD28II4Dp4X6ioalprFaxs=;
        b=HbWrSHHwqa0Qmrwwyrk2jgQTVwtrd/NohOvpFjQ0MqpQ8/vL7PppA960STwLVe5l4o
         FXqD1Lfvx9HERsbX28Yw1WmZqMfmDKKJWmwdivJQlgbL4e2MThtZqIyphkr6xTC0zmg+
         IRxY22Jx0x8c3AC+y08DHkwWmtVree8odXpNNcVvoNOj9N6bjglLk6Q+VoqVqlrPCObU
         KnHxvJ/mvvpZAFiahDn/2eN9NrQxgP3AYt+rxuyFJdiwkWJwoAT8TOYRS794A0P7XOvg
         U1QvLKiDKlVmA+nYVVI2I20zHUHsIenLYKBA612MwUoTW4Ij2xMNIT4PXnPUhyK4jdwX
         /rNA==
X-Gm-Message-State: AOJu0Yy2+yG3dJgZmNPwjBp4fqLOCBwts4ddOgbeQNxWR202yg97+RZW
        MYxS+A+SebeFCInFSlQuozODRS5E2FpxGtI8SinDEg==
X-Google-Smtp-Source: AGHT+IHI4KKF3FIJ0uJCbywmfLAUw9MWg96egfmrbGw29Bp2y3KgGmsoT1wnLQs1LvLRaZKLqck1rXvlL3d8wpTwgtI=
X-Received: by 2002:a17:906:2098:b0:9ae:6196:a412 with SMTP id
 24-20020a170906209800b009ae6196a412mr16962853ejq.69.1696939416836; Tue, 10
 Oct 2023 05:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231010101240.992984-1-max.kellermann@ionos.com> <2023101025-bungee-carve-2b4b@gregkh>
In-Reply-To: <2023101025-bungee-carve-2b4b@gregkh>
From:   Max Kellermann <max.kellermann@ionos.com>
Date:   Tue, 10 Oct 2023 14:03:25 +0200
Message-ID: <CAKPOu+_x=C=1kpU_j0HoVn=o3PxRk=PH7a6YPeW8du_sQxJMYw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/process/coding-style.rst: space around const/volatile
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux@roeck-us.net, joe@perches.com,
        Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 10, 2023 at 1:37=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> Don't encourage the use of volatile please

I don't mean to - but I figured IF "volatile" is used (for whatever
reason, whether correct or not), it should follow the same coding
style as "const".

Do you want me to remove mentions of "volatile" (leaving the coding
style unspecified), or do you want me to add some warning about using
volatile?
