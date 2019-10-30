Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA2F27D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Oct 2019 15:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfJ3PTp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Oct 2019 11:19:45 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39796 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfJ3PTp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Oct 2019 11:19:45 -0400
Received: by mail-io1-f65.google.com with SMTP id 18so2964040ion.6
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2019 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7YNXyj7f8rW8+zjDkawxxyLGJtQwCp34SKVerNZRPbQ=;
        b=oWsbYVn2wH21E81tjjJ3l6Iq0ORB/qlP3WR+Q8r9Z2fUjpbg/uUl9HaP6IzyxnYvVH
         WKmf9Rh+YOwz8WuIcq//YSJmAZD7YV4XP3/kSQFRTSz6C0I0Io0QAnLsOfHciN7ppMzq
         SYuesKoavkQkd03pGl0yhQoo60VYnyfRdJucp9IcL/tuKLm7e5HN1XpIFNp3wYLh5UcY
         bdgym8PGD+cNTB/boNti3JS3zsSRAMNelmsCtMiVsCUujfHKuhVkpS/uXaHhuTmCfr3e
         5RRWn2T+sQ/VNSmZq9Tj7hidfFMMrTf6wFnH9cIkxYKWtjlEKRlOEUgsWgDTnQ9mhjDi
         gzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7YNXyj7f8rW8+zjDkawxxyLGJtQwCp34SKVerNZRPbQ=;
        b=DVYxXAopB4l8vN38nnbwHDC1g3mQACduCfsjAbCr5NVDGzGHLj+tsQO7DMAIujHKuk
         CuaPvqEWfxFLO69JHebEJe83JVTNzKGttsC3NorMkUpB7nKZLWeoX5J6ajLnzOfbsFvW
         NPjEHJqM0RitZmpCD16+/RtClKQ2ldwQk882NgqwprargbQqpIQndysEN1QHxRxPGjq1
         42yoIVFnlVcIp/19xSznWhtKdYrcAuqj8Yu+P1kAs9eWhzhUgfxCvAVsSbPP/taz8RrQ
         pIdXTDr60MmN2ocxUR3gow6V8/8AIez4/zm+Dh2gKGBhtifztftn5CQy3gJIIt266ISZ
         XTbQ==
X-Gm-Message-State: APjAAAVNc61FIJOcaQCu5C4O8qK2jKQSUuDwGYy1wnn9FtQtu/+fSW2e
        8TdBR4Ya5h3z4tOVTeTR7PSQ7HFE1xnfnPQfTyQLVw==
X-Google-Smtp-Source: APXvYqyKGgTnRfDLHHdkSB7llCvZ5cVDKjpUAmAFIAQromO+MWT4WMhJv0CW7Uy5syPMKhupsj3GiXgNXpc5RVQa4ak=
X-Received: by 2002:a05:6638:392:: with SMTP id y18mr165770jap.98.1572448783867;
 Wed, 30 Oct 2019 08:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190829213321.4092-4-mike.leach@linaro.org> <20191026202633.835854-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20191026202633.835854-1-rikard.falkeborn@gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 30 Oct 2019 09:19:33 -0600
Message-ID: <CANLsYky8WozdqOFrD7Q46P3uxWo4dcBjOTpwo+33u9W36WRA5g@mail.gmail.com>
Subject: Re: [PATCH] coresight: etm4x: Fix BMVAL misuse
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Mike Leach <mike.leach@linaro.org>, Jon Corbet <corbet@lwn.net>,
        Coresight ML <coresight@lists.linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 26 Oct 2019 at 14:26, Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
>
> The second argument should be the lsb and the third argument should be
> the msb.
>
> Fixes: 62ab9bce3bc7 ("coresight: etm4x: Add missing API to set EL match on address filters")
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
> Spotted while trying to get compile time checking that the order of the
> arguments to GENMASK macro is correct (BMVAL uses GENMASK).
>
> I have only compile tested the patch.
>
>  drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index 3fc12ac44270..ce41482431f9 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -1246,7 +1246,7 @@ static ssize_t addr_exlevel_s_ns_show(struct device *dev,
>
>         spin_lock(&drvdata->spinlock);
>         idx = config->addr_idx;
> -       val = BMVAL(config->addr_acc[idx], 14, 8);
> +       val = BMVAL(config->addr_acc[idx], 8, 14);

Good catch - thank you for that,
Mathieu

>         spin_unlock(&drvdata->spinlock);
>         return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>  }
> --
> 2.23.0
>
