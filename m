Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507093F0ABC
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 21:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351903; cv=pass; b=gx/bzsBQeqwE6Y5lQ1RubCxZ/ITUNVvzwN7f5lojs5LkF0k/P5Rq5YBQXSFVFBLR+PWgSPyteQNLlUQWz8VRee2csIsTQ2VeQiU5DCl8Cr4dmFg2E4P33uv2wmtwNcAkCb3dAuO2FpafJk09Ay4+coMtUUvoDE2ug7CYlnzFGqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351903; c=relaxed/simple;
	bh=VudM6nzCZVkA9277WVscwWUtl1xQAIgu3m2h8apEcxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNqBsw/ugUEQNKWlsi4RTVaDbU4Z9MGuyVnLXkV5IQFKAywCXWp7vtpqx29tOsW9OdIUaeVdT96MKVW9R8UuPlgvJnHrZE0PV/k0Lbq0I7R/bsNbl7mHvfGKYSjUPuL/fVLFWpWS3inw7zSY30AQZMMsLBlOAGzLqBYxoMDBy9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=P1U8+WnR; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="P1U8+WnR"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso1564987e87.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 14:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773351898; cv=none;
        d=google.com; s=arc-20240605;
        b=P5PelTxgJs/56K0jltuYh9M4yGSD8VgnsiVcWCIqpD/KF75lGcbnohWNEzFYhKsIXU
         53X/x7tJV0rPn3ynr+Ue13nlpmzD5qJSin6e4vOS18APdI21D+41ok5Qvu0GB3B/0gp7
         holDLe0qCACU3IaVN6CwqhWREZPFYmYa3aTBt/ph61pasBsYPpmmOZWvz3KJj8RI9gU3
         m3Mx+brO50asT3RPkSZk4G1RwSHcTrpot3h72tCfv3WEGrAYu8vCZ1+hBX2Y4M1l7aYn
         jLZ82/DaxJEkEtBmjOIOXReDWECROOsqzuLhjeR04sKHDNZFWHi9RLr8DCM1sOB+cJ9R
         IJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HfH7lKknQyQNOSVHyMK46+bKOSN4FbobYHp2cMfhjyE=;
        fh=gGhY3utEDvIgdKiD79h52qlwB5EuAJVBOBtGUcheHGw=;
        b=bD0YwfJ2Y9E5Q5CamtbEmN1CWI3Z0mbN3L11ZMI3b/ua1Csf+WXDT9d+DY2+TzqOFy
         eQbp/QBR6N4fXvhivLJ06y6clf0oWax/x9/q41D6HZbKW+s1sb8N4K2McsITUd+PSwyB
         jw8LAxllkS75QG4GIyjfX1uK6hprGmu/tCjboVd2DrUIt2t7hlYkBM4i81F+PuYEc/Oa
         VPksGpuQYMSVIEY2Th5TmAgjH1OfsGbv5QPPbjNXOaKDWNZNoM5jQACkMYo95Yg9M8gB
         p9IjxuWqZ3T2Xef67B8jBOCASA4lz1HTAM9zOsB7UHd3NKZ6i9VARXojgaocrLzyVVYW
         wVcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1773351898; x=1773956698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfH7lKknQyQNOSVHyMK46+bKOSN4FbobYHp2cMfhjyE=;
        b=P1U8+WnR1Lxln/UwJwc8ebgTjoABiPgnTSelTRWOxp1XWROJwkYsd/Rt1spe3UkyvU
         aXXwCzrLM8uNc3VNLHKn8RC0MhQBW8+9aQnQplWSsYG9S5cs4H+6pmoYj0FFB2zlkm82
         I6klhGgtdfGe+BD1ssrolYw0vvNsJVF183w+mExZ+N6oJ9WYbpvpkAkj8QgoaYTdke7W
         VnVPd++/gk5rhpvgHTjo3oFsozsN2SjQ9kGTSJSYk+hERnR3hdGMXDVyOBq8DjFeew81
         56Qfhf4fW2bz7KKGB1i/OUKLxpcczJRq1bNYM3AONlHtQvtSnTCVjj6LnKyexXbkfmpC
         JvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773351898; x=1773956698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HfH7lKknQyQNOSVHyMK46+bKOSN4FbobYHp2cMfhjyE=;
        b=Ii18Ey9oYYT7QIvbYJK64iyKNYFG9/w/6HgkC0njX6d6Ygnh7rbT7bwP5s8mft/mLc
         VV/aAuLf7lKoIVLrQ1Nm6R3M5NiMK0Cfep8vZ5TjCdGOONcRqvrjLuOgFlzIIhhZPyNA
         dZQEAlzxQqv7zjMvVB4BQqmAQZstgBGm/xNo4yc1Oy5R1I4zBF4d095IYTAARR9Pbdny
         ogtuyOEKAn1dnl9h7IONrEsl0PYNV0i/1vb0WVav0CI83oIeVYrpfB2dCm81Wa7g//53
         ygzuY4n7iapZljRdKiBTu2OE8u8FpQwM1rt4oLjVqzLeI64TM65Emn6Wfft7bpoomUFf
         Ni1g==
X-Forwarded-Encrypted: i=1; AJvYcCXD6lpxMmkBaqEamaPcp2S5NOfhWguo/vFq+69d6sT5b/ZE02ZdIPt6T/oSzXzWbB6a0XJ59DxiCGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfbNXejLBzqnq1ZeLX2GnqkdlvqwCoeGGGnDH1TMb/Uz9fkgqy
	xQQ3qImiH9c56Vtd+vklUESD8LMN69PS2U/JZ34gD1mk30Ij7ln9JilMJQgRCoUA/2Fch4wS+W3
	uHnCFcZihMu4gEQNWLIDDtWCQuE8yzbAP5OIrgU60
X-Gm-Gg: ATEYQzyB273qD1WoFXgzc0HLzs2p5dPIASOfl2mimj0Hxp6ax+6+bNOcIllNYymhpGr
	bhtcKJ6aOWEMd3Nnefe61NqhfjZppWfwy2mINBLXP84djMvJAeJgrfL+g623qQA1VGHfNwBpR+u
	ElSv5lE17W9Ri2YYNZXbSIkDbTF6Y9AA+hbkt4bcuquE8QqFyca0ptOegrm7eXSbV735Vh2UXsZ
	N/097aFN5/rxiCSAMswnGiwnk34/aVe2SlC6m1lXJHUh2BBUKrJ8tfzrsi+t7OcU/scxQeLMcgY
	MT12JQ==
X-Received: by 2002:a05:6512:254d:b0:5a1:45a2:2177 with SMTP id
 2adb3069b0e04-5a162b2af9emr230055e87.44.1773351898274; Thu, 12 Mar 2026
 14:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311194058.13860-1-panchamukhi@arista.com> <09e1535f-59fe-41eb-91ed-2aeb97957bfc@suse.de>
In-Reply-To: <09e1535f-59fe-41eb-91ed-2aeb97957bfc@suse.de>
From: Prasanna Panchamukhi <panchamukhi@arista.com>
Date: Thu, 12 Mar 2026 14:44:46 -0700
X-Gm-Features: AaiRm51hQ3Exo0jf6qTinlBXpNuOgadUGx__Nada8LeERG7UHXRQpfwz9Fpg_no
Message-ID: <CACqWiXCufBst=oga885BjD2Dr3FSaEK-WcJCSC8kjL48BBABvQ@mail.gmail.com>
Subject: Re: [PATCH net-next] netfilter: conntrack: expose gc_scan_interval_max
 via sysctl
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netfilter-devel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coreteam@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fernando,

Thank you for the quick review.

On Thu, Mar 12, 2026 at 5:15=E2=80=AFAM Fernando Fernandez Mancera
<fmancera@suse.de> wrote:
>
> On 3/11/26 8:40 PM, Prasanna S Panchamukhi wrote:
> > The conntrack garbage collection worker uses an adaptive algorithm that
> > adjusts the scan interval based on the average timeout of tracked
> > entries.  The upper bound of this interval is hardcoded as
> > GC_SCAN_INTERVAL_MAX (60 seconds).
> >
> > Expose the upper bound as a new sysctl,
> > net.netfilter.nf_conntrack_gc_scan_interval_max, so it can be tuned at
> > runtime without rebuilding the kernel.  The default remains 60 seconds
> > to preserve existing behavior.  The sysctl is global and read-only in
> > non-init network namespaces, consistent with nf_conntrack_max and
> > nf_conntrack_buckets.
> >
> > In environments where long-lived offloaded flows dominate the table,
> > the adaptive average drifts toward the maximum, delaying cleanup
> > of short-lived expired entries such as those in TCP CLOSE state
> > (10s timeout). Adding sysctl to set the maximum GC scan helps to
> > tune according to the evironment.
> >
> > Signed-off-by: Prasanna S Panchamukhi <panchamukhi@arista.com>
> [...]
> > ---
> >   Documentation/networking/nf_conntrack-sysctl.rst | 11 +++++++++++
> >   include/net/netfilter/nf_conntrack.h             |  1 +
> >   net/netfilter/nf_conntrack_core.c                |  9 ++++++---
> >   net/netfilter/nf_conntrack_standalone.c          | 10 ++++++++++
> >   4 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/networking/nf_conntrack-sysctl.rst b/Documen=
tation/networking/nf_conntrack-sysctl.rst
> > index 35f889259fcd..c848eef9bc4f 100644
> > --- a/Documentation/networking/nf_conntrack-sysctl.rst
> > +++ b/Documentation/networking/nf_conntrack-sysctl.rst
> > @@ -64,6 +64,17 @@ nf_conntrack_frag6_timeout - INTEGER (seconds)
> >
> >       Time to keep an IPv6 fragment in memory.
> >
> > +nf_conntrack_gc_scan_interval_max - INTEGER (seconds)
> > +     default 60
> > +
> > +     Maximum interval between garbage collection scans of the connecti=
on
> > +     tracking table. The GC worker uses an adaptive algorithm that adj=
usts
> > +     the scan interval based on average entry timeouts; this parameter=
 caps
> > +     the upper bound. Lower values cause expired entries (e.g. connect=
ions
> > +     in CLOSE state) to be cleaned up faster, at the cost of slightly =
more
> > +     CPU usage. Minimum value is 1.
> > +     This sysctl is only writeable in the initial net namespace.
> > +
>
> I think it would be a good idea to add under which situations it is good
> to tweak this setting.


Done.

>
>
> >   nf_conntrack_generic_timeout - INTEGER (seconds)
> >       default 600
> >
> > diff --git a/include/net/netfilter/nf_conntrack.h b/include/net/netfilt=
er/nf_conntrack.h
> > index bc42dd0e10e6..0449577f322e 100644
> > --- a/include/net/netfilter/nf_conntrack.h
> > +++ b/include/net/netfilter/nf_conntrack.h
> > @@ -331,6 +331,7 @@ extern struct hlist_nulls_head *nf_conntrack_hash;
> >   extern unsigned int nf_conntrack_htable_size;
> >   extern seqcount_spinlock_t nf_conntrack_generation;
> >   extern unsigned int nf_conntrack_max;
> > +extern unsigned int nf_conntrack_gc_scan_interval_max;
> >
>
> Could it be just int? so there is no need to cast it to s32 later?



Regarding the data type, I encountered the following compilation error
when trying to address the signedness:

"../../net/netfilter/nf_conntrack_core.c: In function 'gc_worker':
../../include/linux/compiler_types.h:548:45: error: call to
'__compiletime_assert_1027' declared with attribute error:
clamp(next_run, (1ul * 250), gc_scan_max) signedness error"


>
> >   /* must be called with rcu read lock held */
> >   static inline void
> > diff --git a/net/netfilter/nf_conntrack_core.c b/net/netfilter/nf_connt=
rack_core.c
> > index 27ce5fda8993..54949246f329 100644
> > --- a/net/netfilter/nf_conntrack_core.c
> > +++ b/net/netfilter/nf_conntrack_core.c
> > @@ -91,7 +91,7 @@ static DEFINE_MUTEX(nf_conntrack_mutex);
> >    * allowing non-idle machines to wakeup more often when needed.
> >    */
> >   #define GC_SCAN_INITIAL_COUNT       100
> > -#define GC_SCAN_INTERVAL_INIT        GC_SCAN_INTERVAL_MAX
> > +#define GC_SCAN_INTERVAL_INIT        nf_conntrack_gc_scan_interval_max
> >
> >   #define GC_SCAN_MAX_DURATION        msecs_to_jiffies(10)
> >   #define GC_SCAN_EXPIRED_MAX (64000u / HZ)
> > @@ -204,6 +204,9 @@ EXPORT_SYMBOL_GPL(nf_conntrack_htable_size);
> >
> >   unsigned int nf_conntrack_max __read_mostly;
> >   EXPORT_SYMBOL_GPL(nf_conntrack_max);
> > +
> > +unsigned int nf_conntrack_gc_scan_interval_max __read_mostly =3D GC_SC=
AN_INTERVAL_MAX;
> > +
> >   seqcount_spinlock_t nf_conntrack_generation __read_mostly;
> >   static siphash_aligned_key_t nf_conntrack_hash_rnd;
> >
> > @@ -1568,7 +1571,7 @@ static void gc_worker(struct work_struct *work)
> >                               delta_time =3D nfct_time_stamp - gc_work-=
>start_time;
> >
> >                               /* re-sched immediately if total cycle ti=
me is exceeded */
> > -                             next_run =3D delta_time < (s32)GC_SCAN_IN=
TERVAL_MAX;
> > +                             next_run =3D delta_time < (s32)nf_conntra=
ck_gc_scan_interval_max;
> >                               goto early_exit;
> >                       }
> >
>
> READ_ONCE() is required IMHO as it can be modified from sysctl concurrent=
ly.
Done.
>
> > @@ -1630,7 +1633,7 @@ static void gc_worker(struct work_struct *work)
> >
> >       gc_work->next_bucket =3D 0;
> >
> > -     next_run =3D clamp(next_run, GC_SCAN_INTERVAL_MIN, GC_SCAN_INTERV=
AL_MAX);
> > +     next_run =3D clamp(next_run, GC_SCAN_INTERVAL_MIN, nf_conntrack_g=
c_scan_interval_max);
> >
>
> Likewise here, READ_ONCE() recommended..

Done. I have also added a local variable gc_scan_max to avoid multiple
load instructions since it is referenced twice in the code.

>
> Thanks,
> Fernando.
