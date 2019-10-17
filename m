Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C902B7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Oct 2019 19:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503449AbfJQT0H (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Oct 2019 15:26:07 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41765 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393438AbfJQT0H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Oct 2019 15:26:07 -0400
Received: by mail-io1-f68.google.com with SMTP id n26so4441202ioj.8
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2019 12:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fags3H8qXAtbjD1auFiMSb1b2IbjWwWbPMcWqBZERaI=;
        b=u569V9s+dhCShH6dj27sogpkTegN9KyYACifmiU87o475C91cnoX4NN18v64I1Hb9/
         pUNe+sjj9kXhrefmWhsJ9SZKQFvvTv62uVra5rrexs5fp4gtGVZrmwz1xvKYf+Sz0m/4
         DOouxaRIJOHCFGMTo2jS23R57IMT3LHhxea6Ne6DmnEVIA2Y6i+h7KOeRErw3q8JaSCE
         TSQ48d0T0WY7yKXgscJbwOHGfO4pOh663wOz232sHearcSSNiNvyvAi/jKJxHoICe+z9
         sRf4GVMq0i4X7oYK6uTbTB3Qzqw9H0qZuCtmUWInmlnPcznRu0pnvqwlR5GY8piQxqCp
         GV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fags3H8qXAtbjD1auFiMSb1b2IbjWwWbPMcWqBZERaI=;
        b=s5yX2gd5KnonyuREnMxmVcqUWAaOqTmbuLw++zsO+BdCs60eUf+1pD61g0nk0w//G8
         EeQ0CRW9f+1wD7dwuz3H+ClZWgePtQfHFqYQpm8Db9QcEvV8H2d/kft2ZpustSVP29uF
         RQ8lAMfmID8MIyGvkG7g5q3W1R78FtyB5VJqQvpfInP+zgeDgQ4VY23mBQJZTzJy0OZH
         Cmytc/1S1I9dNEGIqmkrTW2OlL6morUssy/+qmWvMNfXUO6HyWPbJXxRhbxVp4v+3xyj
         iW/+53x5InqUEAr8TNogyFP7daOveDHwBhun+uw3951L0Ugb6tKtMlvtinaIwgo2/xzI
         sgxA==
X-Gm-Message-State: APjAAAVZJqsdqMntA0KuwIhPtQ+YQE4T5Iej51lhtOomJ9Bkj4cJeJ0c
        TWvWO/dUrU5gvUw8ZaNV8yRIk9prKmaTT5zbVpwyrw==
X-Google-Smtp-Source: APXvYqzjK0L400i32dIEttvsop7YbCoXXqMdybXgVmbxFJVPJXC46bonyqTofFwl79KV66//rZehudtz5p9arLk59g0=
X-Received: by 2002:a05:6638:392:: with SMTP id y18mr2230970jap.98.1571340365705;
 Thu, 17 Oct 2019 12:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191015212004.24748-1-mike.leach@linaro.org> <20191015212004.24748-4-mike.leach@linaro.org>
 <20191017180035.GC17991@xps15>
In-Reply-To: <20191017180035.GC17991@xps15>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 17 Oct 2019 13:25:54 -0600
Message-ID: <CANLsYkyYVvDJRtBg7B=Zai_h=PDSQqtq-EWBH231X8HJ7NdHdw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] coresight: etm4x: Add missing API to set EL
 match on address filters
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jon Corbet <corbet@lwn.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Oct 2019 at 12:00, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Oct 15, 2019 at 10:19:56PM +0100, Mike Leach wrote:
> > TRCACATRn registers have match bits for secure and non-secure exception
> > levels which are not accessible by the sysfs API.
> > This adds a new sysfs parameter to enable this - addr_exlevel_s_ns.
> >
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >  .../coresight/coresight-etm4x-sysfs.c         | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > index cc8156318018..45fa7743eea4 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > @@ -1233,6 +1233,47 @@ static ssize_t addr_context_store(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RW(addr_context);
> >
> > +static ssize_t addr_exlevel_s_ns_show(struct device *dev,
> > +                                   struct device_attribute *attr,
> > +                                   char *buf)
> > +{
> > +     u8 idx;
> > +     unsigned long val;
> > +     struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +     struct etmv4_config *config = &drvdata->config;
> > +
> > +     spin_lock(&drvdata->spinlock);
> > +     idx = config->addr_idx;
> > +     val = BMVAL(config->addr_acc[idx], 14, 8);
> > +     spin_unlock(&drvdata->spinlock);
> > +     return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> > +}
> > +
> > +static ssize_t addr_exlevel_s_ns_store(struct device *dev,
> > +                                    struct device_attribute *attr,
> > +                                    const char *buf, size_t size)
> > +{
> > +     u8 idx;
> > +     unsigned long val;
> > +     struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +     struct etmv4_config *config = &drvdata->config;
> > +
> > +     if (kstrtoul(buf, 0, &val))
> > +             return -EINVAL;
> > +
> > +     if (val & ~((GENMASK(14, 8) >> 8))
>
> This patch isn't compiling for me.  A parenthesis is missing to close the if().

I will fix it because:

1) I've reviewed this patch several times already.
2) The solution is trivial.
3) I want to pickup patch 04/11 and there is a dependency with this one.

>
>
> > +             return -EINVAL;
> > +
> > +     spin_lock(&drvdata->spinlock);
> > +     idx = config->addr_idx;
> > +     /* clear Exlevel_ns & Exlevel_s bits[14:12, 11:8], bit[15] is res0 */
> > +     config->addr_acc[idx] &= ~(GENMASK(14, 8));
> > +     config->addr_acc[idx] |= (val << 8);
> > +     spin_unlock(&drvdata->spinlock);
> > +     return size;
> > +}
> > +static DEVICE_ATTR_RW(addr_exlevel_s_ns);
> > +
> >  static ssize_t seq_idx_show(struct device *dev,
> >                           struct device_attribute *attr,
> >                           char *buf)
> > @@ -2038,6 +2079,7 @@ static struct attribute *coresight_etmv4_attrs[] = {
> >       &dev_attr_addr_stop.attr,
> >       &dev_attr_addr_ctxtype.attr,
> >       &dev_attr_addr_context.attr,
> > +     &dev_attr_addr_exlevel_s_ns.attr,
> >       &dev_attr_seq_idx.attr,
> >       &dev_attr_seq_state.attr,
> >       &dev_attr_seq_event.attr,
> > --
> > 2.17.1
> >
