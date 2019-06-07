Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 34BEB7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 22:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730963AbfFGWIU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 18:08:20 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33629 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729787AbfFGWIU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jun 2019 18:08:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id v29so3035523ljv.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Jun 2019 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yHlZ/09HVQo+stV3OrPMedEmO1HgLZq5U7B9/c6/p7Y=;
        b=QrGIZKbx5k7Xqdv8z/yDPKaoDJuxRaggORVS9azbjG280GDunTQtibk90YWn/nobhR
         wiD+GkdtLQmOI3rndTluSkSSzvyxl0QYWwTNX/kjxbjMzi08Of0f5IrjSjj71JN/63Cz
         N5J4b5LskZkGWp5+qJ4eV/dmhkOEssyIvvHvNFJmi8JVuZxuMELvRlejSE35OkQeVZtj
         lMYPOdya2Q8etIbvyQX6M8Ab84uY9UKBtWdIYJ5LvaNmwpJn2svZpvCPpMPQmss/z6Oq
         PKWfQhNWjleRXUuugMH14Gm6sK4aSig5EcoJLhtJ2bVhRzZIUrKCFWP3NnlAgDhybrif
         5cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yHlZ/09HVQo+stV3OrPMedEmO1HgLZq5U7B9/c6/p7Y=;
        b=KKLHX+6Zv07wpt+WgRSvwXSJqe/F9c7xFcv9Pi1xtcxhSJIjgDEX39VkcZ3NyFidi1
         wG+FTpefRun4GzPFQanC7YhmAyX+kjziQCJRD8lrxNoMBQjTO93QA0nSGy7LKw0U5dpN
         Y07sQcdIIoJe247ilHx0YFe3f/qT1HCWs3M9GTbz0zjlw7pac1mGDcaqn5Daf8TTkxwk
         kByip3SsDvgfG8qh6hIdOJ9gRoW/EL4+3zKLBkMP2DrdIPqfQ6C1dsgLbwJJKcq3UzSW
         ePzvabxUpguyyGvuTWohtbzQjmPlVwsM8YFumBBpHlxcdLJw9mNT5dNmSCC68M+TgILI
         d0YQ==
X-Gm-Message-State: APjAAAUO+LkZtM0aWceWv1Y3yFMsJnU9U5GD4VP2dpP685ZO1Y6dLMMA
        Yfnhp408YGnMWqZz4wmLuomuvytfNCs65FQy5uWks9yl
X-Google-Smtp-Source: APXvYqxXuBhhgn7MmZAfsZykWUQKNY/KzC0S0yVRQlT2pFkpO2Tn+jLM+faONvbgsZcuBOlTxFOjmjWE8oPicI3r45M=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr29274449lji.94.1559945298255;
 Fri, 07 Jun 2019 15:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559656538.git.mchehab+samsung@kernel.org> <ee8f4f56658247a0ab0d9e2c16a9afafefe38da0.1559656538.git.mchehab+samsung@kernel.org>
In-Reply-To: <ee8f4f56658247a0ab0d9e2c16a9afafefe38da0.1559656538.git.mchehab+samsung@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:08:10 +0200
Message-ID: <CACRpkdayQdrtqO3aygY1uDG0LCX_9rVnSnxP5F_C-KMZURTAYA@mail.gmail.com>
Subject: Re: [PATCH v2 12/22] docs: gpio: driver.rst: fix a bad tag
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 4, 2019 at 4:18 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> With ReST, [foo]_ means a reference to foo, causing this warning:
>
>     Documentation/driver-api/gpio/driver.rst:419: WARNING: Unknown target name: "devm".
>
> Fix it by using a literal for the name.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Looks identical to the v1 I already applied, so keeping
that one.

Yours,
Linus Walleij
