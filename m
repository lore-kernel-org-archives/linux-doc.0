Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD763612D8
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 19:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294916; cv=pass; b=DfpNlU8CZvTZCkcOputOPiE7RIAHTPDdMzxiPPrIYpBB1o2/rV7me97fUBEkmf6Fy/ddP28zxvCD/nnKDAo3iOjbe1AlEyZfPdpXQUQeV8qE2Zk8UCW442wTeuVvWAArF/6ux9Rpo+hZ1i0u8Oo0JKN/uWt1NKuieylVsuF0ULU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294916; c=relaxed/simple;
	bh=K8JhU7lUaBhmEPxP3JMLXEXJ9A7xlBu0wXvdeeBvNL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTdSugZLGXz/lXxesApOV8tkvkdj/mo9NUuFjDW5iGKs/OtfunoOc3hWf5G2qRsR+2cKIiJ+b3F6UHqx16Yevhufx3UrpzGs2MRXr90R2qyQfnGZ4wemUyCOgzJbwNvt3heBPSYo3NGJdlzg4uZscwAPCiVDZgTzsqIAdxf27GM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzxq2tdY; arc=pass smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzxq2tdY"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-128b9b7e3edso7464734c88.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 12:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774294914; cv=none;
        d=google.com; s=arc-20240605;
        b=SHZtTwDNDivcHZiMzzWsCCUMg0nwc1A2qx+alvFXud1ZI1iCy3sWE/ZZPiW/A/+ylW
         OnbcFnzVNGtY3ffK5fXlnaAgiC7fmMUyDo5G6dml+s5n2lrMiZ59EeFql4fBQ6ivZFIu
         Gkedcs5+pfce6XIAmnJq0OcZobnfXxzyfPAWck4PcTrhQpXX6K++VQk1R6c5jSRtpY7h
         8GzY+RG0+sm567V70LLYH8wb+Z2xBuVOKoy/ILo/T18wkTTJCPozZ4GsCGhU+Aw93TR1
         XvxauYaBSDt7BG9fspuRfU8jtyE6uOtvTJ2jUzcG2qQCl3vzhyB3OaDWpJfW8L626MRr
         t+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VhD/x6CWko7H2rTbKhY13VQ01meQMOQRBoD9zfMqn1I=;
        fh=95mB+YYUml4pGjZTh6ZCF18VtCSSMfekD00jjgOfmQI=;
        b=X16yrN8hkH7gQORejV1rpFFMgEAfpSitfyqAr7DjybR8AnHoTwSwiWBqSWvCl3KwsG
         J/Ej3QXsDk7q/Jhl+TPKORmXNeLRasTeeX/bho/6ixfzeovM7GRiU1DJ64p0YSKSz0ns
         4cJFDtsjIsXAgpmAzU0ctij7PknXOhMkBGBfobW3HHGXQJ669jRLBNTN+35pO8CiihLW
         OEwJsxP9C/dJfWVMNuO/5bF853silsHyLfrlY7Gwtbh4dpCQo/zL1WfvUZNfOwlmdJCD
         CwZUeYfodlQxtGeRRC/+pQHfqJqsDZoWYhhd3tp5nUiC57FvTnuVVTPa/fQqZw/LFuki
         0Sfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774294914; x=1774899714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhD/x6CWko7H2rTbKhY13VQ01meQMOQRBoD9zfMqn1I=;
        b=hzxq2tdY8mM3S9GWw6iNJNlG9bNDiqT/m2mwd+kniscFHFtAMbfrUKGQjU6pUPRlIV
         UDNeV54AqMXAaHAY6+/3DYSPObcMl3JBY2U71UK+1JW/u1Wf2UcHYytu8ccwtWIUxr/k
         hjZKUm0cgXhzbO6BA2JAxF0dCZTJ5sYKiuUXVZECTyQLfyGrk6kUpq59UrYJ5v8hTMl7
         vcmhpqdrg1Ravvd/ChafSaXpzsR1mvv1yhMv/VD66DqfVbv2IXtw8AhhgydZwABole5Z
         YF0DjNlitP+B1k3XYipVQSIV2GQBGyJfWbbZkcrplOZjp0JXrwwIzLKEA1+03504wjuE
         5bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774294914; x=1774899714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhD/x6CWko7H2rTbKhY13VQ01meQMOQRBoD9zfMqn1I=;
        b=jiP/pC/wlRCqkyoii71ARFGkMErDCPd4eWGK2PzyTjQqpgIcWXhgbX6lTIGBopdeZN
         E49ahQV92L1QY0lkjBGKkR8pcdWrAVaNra3NdKVoSkE6UxVADg1nLperYBzxdpcdsItE
         UcqwCL9wALyKa+qki1ED7WZTKm9rt7hPFseFXsR2uRWVNRRe+MnAUbBDu54twi9ViIwM
         4Oksv1+84PHaGU1W9eTK5VyTVZs28DyWs/QUCHAPBfW7lgItg7umbwhYORPgOZCjiNGp
         pHIDwouAk9VHmHwmuXrGwRK7pvnG0oAZqV+hK4UTS3NI1QLo0icwcokRQYAWGxgur+Tz
         qeww==
X-Forwarded-Encrypted: i=1; AJvYcCXWImm+0h8von7vGwWrHm06BcTva4vAk/9jYDCRQQy83dTeHUU3Lj8mAKDuDw5rFHeR9epR2PNxNbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQvAXxVg72SIJEO7QlKHcmt+kz+NYaidxeG5HhY93VjT/WZNbc
	wjC6Dtv+f24LOsVBiU0WFI0zmA3RWVDtF/3DHCj4lnUrZv2CS4DYa6Loj8xsi9MNRW36F6J6UlV
	FJPfmM+lpRmejd9+mzQaFDEY9+kvXdrifL6UfqtUw
X-Gm-Gg: ATEYQzzOjo4qc7CLRv+I+U1lsqTdjaBouWI07KxOjpK51U7vGjdm+7UT8pe69AMPaSe
	AihNlWrf3Qs2Ne13ih3jCeqx18POwQiV+Hd5WwbMXsA8DJHULDlgQgZ7AzmEoljBM5VShzm3/tm
	FQl0Lv+VkT0mxgLHY26lJicKPcmkmUx1imUEgHL+KkCX3YKn+AHKsxXvvnRFJsafFKzqfn9hX2i
	YuN5ZUlRh6YCZhl699zpPqAgx9HEcJwbFYbREWVkYQYMubmcqvauPbbhoiJkc1+ipsqO+wSV6nt
	wrzA23k=
X-Received: by 2002:a05:7022:eac8:b0:128:d39a:b124 with SMTP id
 a92af1059eb24-12a726d95a7mr6584836c88.19.1774294913893; Mon, 23 Mar 2026
 12:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320190453.1430-2-ravis.opensrc@gmail.com> <20260321165425.84273-1-sj@kernel.org>
In-Reply-To: <20260321165425.84273-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Mon, 23 Mar 2026 12:41:42 -0700
X-Gm-Features: AaiRm50_X3MTqd7TbETXCV-fpp-iatrBJyNolNtz9qo9eeLJuyZ9kt7eVE9VXlM
Message-ID: <CALa+Y16i0f5D_ZTVcfVa1DgeZL1btvUJxjOvoyFEYNkT7K-grg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/1] mm/damon: add node_eligible_mem_bp and
 node_ineligible_mem_bp goal metrics
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 9:54=E2=80=AFAM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Fri, 20 Mar 2026 12:04:53 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > Add new quota goal metrics for memory tiering that track scheme-eligibl=
e
> > memory distribution across NUMA nodes:
> >
> > - DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP: ratio of eligible memory on a node
> > - DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP: ratio of eligible memory NOT on
> >   a node
>
> The description for the second metric should be "ratio of ineligible memo=
ry on
> a node".
>

Got it. Will fix the commit message.

> >
> > These complementary metrics enable push-pull migration schemes that
> > maintain a target memory distribution across different NUMA nodes
> > representing different memory tiers, based on access patterns defined
> > by each scheme.
> >
> > The metrics iterate scheme-eligible regions and use damon_get_folio()
> > to determine NUMA node placement of each folio, calculating the ratio
> > of eligible memory on the specified node versus total eligible memory.
> >
> > Suggested-by: SeongJae Park <sj@kernel.org>
> > Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> > ---
> >  include/linux/damon.h    |   6 ++
> >  mm/damon/core.c          | 158 ++++++++++++++++++++++++++++++++++++---
> >  mm/damon/sysfs-schemes.c |  12 +++
> >  3 files changed, 164 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/linux/damon.h b/include/linux/damon.h
> > index b1d8fd88a0fc..490918804f85 100644
> > --- a/include/linux/damon.h
> > +++ b/include/linux/damon.h
> > @@ -193,6 +193,10 @@ enum damos_action {
> >   * @DAMOS_QUOTA_NODE_MEMCG_FREE_BP:  MemFree ratio of a node for a cgr=
oup.
> >   * @DAMOS_QUOTA_ACTIVE_MEM_BP:               Active to total LRU memor=
y ratio.
> >   * @DAMOS_QUOTA_INACTIVE_MEM_BP:     Inactive to total LRU memory rati=
o.
> > + * @DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP:        Scheme-eligible memory ra=
tio of a
> > + *                                   node.
> > + * @DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP:      Scheme-ineligible memory =
ratio of a
> > + *                                   node.
> >   * @NR_DAMOS_QUOTA_GOAL_METRICS:     Number of DAMOS quota goal metric=
s.
> >   *
> >   * Metrics equal to larger than @NR_DAMOS_QUOTA_GOAL_METRICS are unsup=
ported.
> > @@ -206,6 +210,8 @@ enum damos_quota_goal_metric {
> >       DAMOS_QUOTA_NODE_MEMCG_FREE_BP,
> >       DAMOS_QUOTA_ACTIVE_MEM_BP,
> >       DAMOS_QUOTA_INACTIVE_MEM_BP,
> > +     DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP,
> > +     DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP,
> >       NR_DAMOS_QUOTA_GOAL_METRICS,
> >  };
> >
> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index b9e12865622c..3e0ac65e34a0 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> > @@ -17,6 +17,8 @@
> >  #include <linux/string.h>
> >  #include <linux/string_choices.h>
> >
> > +#include "ops-common.h"
> > +
>
> I don't find a reason to include this, and I'd like to avoid including th=
at in
> core.c unless it is really necessary.  Could you please remove this?
>

The include was added because the implementation uses damon_get_folio() to
determine NUMA node placement of folios when iterating eligible regions.
Would you prefer that I move the damon_get_folio() declaration to
include/linux/damon.h, or would you suggest a different approach such as
adding an ops callback for the node calculation?

> Below looks all good for RFC level code to move on to the next stage (dro=
pping
> RFC tag). :)
>

Thank you, SJ! Will send v5 with fixes once I hear back on the above.

Best Regards,
Ravi.

>
> Thanks,
> SJ
>
> [...]
