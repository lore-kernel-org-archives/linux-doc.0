Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DF92D0C98
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259928; cv=none; b=ihr/EwsUJNcHYuGxwOvroLAI2BquuQq+8rMkbtKS+fCyaKIyY/g7eRVRg40W1HEkKzxqPsQe6qUOS5diptKxvqidKYuutICH8q/xNWLztzxWQthz41VwiTZvZHMCtD+OUj7uKz1etCX/HHIoFLemKtOr3LoJMN3M1IJ3MTZiuCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259928; c=relaxed/simple;
	bh=dKJFC4q6Y/FQ5fG0bQGe91ERSia90QlAE9pZ3k7HUGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPncur+8UmxAcnSjlhyT+qbGfzbRkUoBNIh0HKeI8AT8Ofh9BBOmJNOkrXCBrUgq2Zrx9p92SjCkTYgmkMEtc8RDM3UeYs+TfQft6wZ/qWsRo2CPz44q5HmE9QoFxmLZ4b1fv2B0ZVSu0quPea7mjGBk1A5aMbTRpygAEHOlmAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeodskLu; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeodskLu"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88054872394so13136126d6.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764259925; x=1764864725; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GapapUbs7e3KQYoiEBxDXMAXQNgCZcbnNy9kg7gHKRs=;
        b=qeodskLugN2Zmdf/vZdSy1fGMtIKQq2XdEQqodeVPWPxL7TrgbyiJkY6M7cO8Ld0LC
         j2+PEIHz19GIKyCg6GgsYJ97M5LBlI9xJIE6gafYeg4EAxZ1UF7M712UlmMOnYBVGd/n
         EZUj1Bg3hRtXz1HGa82CE6hcZs9FiDmoL5kFiW2fJ5GiEa7WL5uiM7lLxiHd003Vx2Sf
         Cm7ocN4fUlxQJAZl24283KXdlpgLETUR23gJTRgkp3u3IqNIkdibMnicHvtV6kxQFSS4
         6/1zWl3GabhhJn7EHJ3gN4NL496+52hXwbD4rZHH8JhZ3bRqOz8EnUxyb7Jf50H9O1HT
         lKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259925; x=1764864725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GapapUbs7e3KQYoiEBxDXMAXQNgCZcbnNy9kg7gHKRs=;
        b=swbZRrl4zrQ8dh2iiIUFBpRB2ZNKzM7nuJ1Q+j/M4e29i8yy1vEsq4W5rwAk2L32zz
         LjoWCE8oD31wf+JjMfUrfgEMZKPBsu+fMChqyA0PR1VZ/OlHaTqOn6m0agHDXDft5kH+
         IK4R4nqMops65kcs22BVhWatIt48Q6yKKEZEBLTb1JYenwcbJiQEmHa9LD4C+nqCpVwm
         G+JaUjSrDlxO7ngXnIrJlD3erM887d7o3p9VG4bTtUDffHaM/3bJ+dr+vXJsYmMJsbKE
         MZ6yrCb80z2gs1pV22wxytuVXYzIZ9fzNwVoMo1kd0z8fKOOCzIChtErThR0dYE5dsMP
         RsJg==
X-Forwarded-Encrypted: i=1; AJvYcCVNrXRlSwESpdgcGERvB+QptnMbDE6zhgo/lVVYCg8s7kl30By0Yvcbm0ErcjyGbdOIV7uEKUauNsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+RsumM+tjIYOTeB8WxrPQ99R2WWLpBL7OC8v5Hodx2BXTlC7
	GstGRS+P09SbBGzjYzvpBYZ6Nxnky0r5JRwlV67BtGW6hQXuFV8XNSlGeRJERk198SjLvwL5ehe
	UHG8PXxyNRyjtXqpiIe/F4GWEbS9CT52x0c4tZH2amQ==
X-Gm-Gg: ASbGnctNs5YUEytto9m1105CsEBaggcOgDkeGajgR+UoS46sD3l2Us69G1MDTVZ7Hgi
	AvK0N4G4MAI8AZrqoa2fXKYEZCgxYilhw8rLB3FkG33ZZVY9+4TwfBVmfq4iZ4icBCUqRlju78r
	QBElY2/kdne95LM8rjngOAOCjOSTQUKc3nsnGZqlvtGef5o6qt3ur9OOxvOx3EO+6DLWefMpQiE
	QGycraKDl6TkPUbYWbBZAGBSe0upb3+69hniGTcBr7D9pT+i77TlCDa+Ld0I628wBVQFQCmx8mF
	lPT5SuucizaNQ1dzTKzpew+q1672
X-Google-Smtp-Source: AGHT+IHsGV3TEa2pdwvHDjBWy4WnWcNbtFiNFi+YFp/54ivvMFJzi1TLM9DpHmzYKL5gS2uzB0O836iJUO6h3xgHaZE=
X-Received: by 2002:a05:620a:2982:b0:8a1:762a:ab13 with SMTP id
 af79cd13be357-8b33d1dd003mr3272403985a.10.1764259925082; Thu, 27 Nov 2025
 08:12:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org> <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
In-Reply-To: <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 27 Nov 2025 16:11:54 +0000
X-Gm-Features: AWmQ_blRpcZYUNReouRYTIPa5Ymx0XpGoIz3jg-XNCjhMsDaPOcIssoxm5yqYbU
Message-ID: <CAJ9a7VjOP4_VtO9zi21xDxRqkybeS7V3iGnH5AKhHLEPYUCQCQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

OK I see it now. The real problem is that the logic to determine if we
are to set a counter based timestamp is confusingly spread across two
functions and two patches.

On Thu, 27 Nov 2025 at 15:48, Mike Leach <mike.leach@linaro.org> wrote:
>
> Hi James
>
> On Wed, 26 Nov 2025 at 10:57, James Clark <james.clark@linaro.org> wrote:
> >
> > Timestamps are currently emitted at the maximum rate possible, which is
> > much too frequent for most use cases. Set the interval using the value
> > from the timestamp field. Granular control is not required, so save
> > space in the config by interpreting it as 2 ^ timestamp. And then 4
> > bits (0 - 15) is enough to set the interval to be larger than the
> > existing SYNC timestamp interval.
> >
> > No sysfs mode support is needed for this attribute because counter
> > generated timestamps are only configured for Perf mode.
> >
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Signed-off-by: James Clark <james.clark@linaro.org>
> > ---
> >  drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
> >  drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
> >  2 files changed, 20 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> > index 24d929428633..128f80bb1443 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> > @@ -7,6 +7,7 @@
> >  #ifndef _CORESIGHT_ETM_PERF_H
> >  #define _CORESIGHT_ETM_PERF_H
> >
> > +#include <linux/bits.h>
> >  #include <linux/percpu-defs.h>
> >  #include "coresight-priv.h"
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index c7bf73c8f2d7..0129b0502726 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
> >   *  +--------------+
> >   *         |
> >   *  +------v-------+
> > - *  | Counter x    |   (reload to 1 on underflow)
> > + *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
> >   *  +--------------+
> >   *         |
> >   *  +------v--------------+
> > @@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
> >   *  | Timestamp Generator  |  (timestamp on resource y)
> >   *  +----------------------+
> >   */
> > -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> > +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
> > +                                      struct perf_event_attr *attr)

Should pass ts_level in here

> >  {
> >         int ctridx;
> >         int rselector;
> >         struct etmv4_config *config = &drvdata->config;
> > +       struct perf_event_attr max_timestamp = {
> > +               .ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
> > +       };
> > +
> > +       /* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
> > +       u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
> > +
>
> I could be missing something here - but if we have a perf command line:
>
> perf -e cs_etm/timestamp=0/
>
> is this bit not changing that to timestamp=1 regardless? The docs
> (patch 13) indicate timestamp=0 to be timestamps off.
>
> This command is used in test_arm_coresight.sh when testing the
> combination of options on the CS system.
>
> Mike
>
> > +       /*
> > +        * Disable counter generated timestamps when timestamp == MAX. Leave
> > +        * only SYNC timestamps.
> > +        */
> > +       if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
> > +               return 0;

All the attr manipulation logic should be where this function is
called not in here.

Mike

> >
> >         /* No point in trying if we don't have at least one counter */
> >         if (!drvdata->nr_cntr)
> > @@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> >                 return -ENOSPC;
> >         }
> >
> > -       /*
> > -        * Initialise original and reload counter value to the smallest
> > -        * possible value in order to get as much precision as we can.
> > -        */
> > -       config->cntr_val[ctridx] = 1;
> > -       config->cntrldvr[ctridx] = 1;
> > +       /* Initialise original and reload counter value. */
> > +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
> >
> >         /*
> >          * Trace Counter Control Register TRCCNTCTLRn
> > @@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >                  * order to correlate instructions executed on different CPUs
> >                  * (CPU-wide trace scenarios).
> >                  */
> > -               ret = etm4_config_timestamp_event(drvdata);
> > +               ret = etm4_config_timestamp_event(drvdata, attr);
> >
> >                 /*
> >                  * No need to go further if timestamp intervals can't
> >
> > --
> > 2.34.1
> >
>
>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
