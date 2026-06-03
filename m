Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676F402BB5
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517663; cv=fail; b=fB6yjqrXr9bM0BNmDa757qiSHLDJD2ZvTf615sk2AuzeSfrXiyrDm64GHxebpYDTsyDTzzhS1h+UW/o7HeprNoXWW4JJrUsqhTMYueK/R8s51G18KpKAPjwe6+hKypjKxdup1x/58JbWlcg9C2paOYppOMqfAGcrdfW54V6bOMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517663; c=relaxed/simple;
	bh=LvN7g8r9T0y2s5H4Rfngk8a1ZC7WHh0f8kfyQ4R00BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpBedlB4RNguxQnDRlv0J5svKKgcm9zGzmycIjDtEd5bmB4fCu5P8Qz92RqQPE9QK4Z8tyWeqhWl+vF5sFOjuxtgx0ZoDNcFKHZTFbHykRZhAXbcBNn4nWhOpMUTqJXPn6wE94M6Nvyda+sgqiErVbRV83M7OsDY0G/ftX5xQVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=XwAzBLTO; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="XwAzBLTO"
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653HTs5n1341298
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 13:14:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=4tj1er0nsZOlN/VikeOgpDrUwPJjFw59fS3l5LCt/Gc=; b=XwAzBLTOfVjE
	W6pepH6rhGEeGd84exyvianjoye5xfbrCvxNMmKbbU0wQPXMI+pu8AjqFW1yFOBg
	6RuEtULwqBDAdYdto/OdAeIMu053rb6TUHJ5laAw7/2ZLapSf462wGDSxklCh/9s
	BUGrA2WCYTXV9WTor3nhs+gjGzGS2jtwniL2KVUEr3yLNM3ncmfIzAKqgGatgH3a
	704mtvdexkFD9poyqEKm8eFdYkGzfy20NKSgoZlYy5KWA4SuDK2duHEzQ7o85oxu
	EUKJeLzV0LHOBMvgcKP15IglkO3CmO9PtxVsPS9t0/I9ulULNxw5jK4TFQ82hkKq
	tweJQs+HqA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ej0tqhy5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:14:20 -0700 (PDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175bb9d47fso74430691cf.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780517659; cv=none;
        d=google.com; s=arc-20240605;
        b=encTwnnV1UqGFN7XJLYFGr9UYD796gJ4XjDoE7XrkQPZGFU8NGwQ3eZ6MRgQZiHSjS
         9+hzYrNzW/TEkPoGAmNURnf5i9mU3qWT5p/W+WpCm9FmScvtgJsKZ6k7t4EEiQ2Doi93
         zXdh8EpA8eGmJ+J8L0QlSXfMmF7f1lVUAGQUlJiqt9JyOeO3QM9pw9CVqZmrQaXhbqQp
         i9AUNdLZPRDaOK1TBHW3mkBU/5hiScJKJu6ioU5prh2WWYjALKUEDLSGF+kgbYT3btxs
         AYe/Jg0SYh4cmvH/WP0iiTbB+vXo9RuFM7Tzv9A161pA8W0IHfB+fdAET6vEVHsotnWk
         Hl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=+fbhy8wJvDEX6LNScDKxQvPFYtrz+FevWbt3mwiIuPs=;
        fh=E/CvdG2tYKmLm16mL8tVyq0JlHtbg7DsoB99b/sr8y4=;
        b=j26dBc39QXOrFACopp97UJbDO89FwK/Db9HkCPpLzw+w12CeqSlgPpFa4lTlBqga8I
         YQLSSBcVbF83M7+3rCu09XzFpyHPw+ru2ub23rsgVUSmKeMHnSYDm0nPM6eoaJ8BgC7j
         9nivSE+Cu8ZLUEObKMEXcnNcrXnhqgXVZCUFnWCorMozG7BwzH+sXNbHlcIyA1JYAqIc
         /XnAmOfeFSE6geDyqgeiw2s65d+/AfsK7oj01kpOPm+QcZisGTTe+YbfEXReYGKTAqna
         Ornd7JPoIdd/kF2Vud4cQevBAFXkxeVLXMndGEftKGVASvpcPLG8DhxHPXceHYnUzhn+
         A1yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780517659; x=1781122459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+fbhy8wJvDEX6LNScDKxQvPFYtrz+FevWbt3mwiIuPs=;
        b=JN5+6Vh5bNM9yfJKVJX/dau5hgFsM7ujtkeaMfGBThtkNuT8d4q2npi9x+cfAutbP6
         3Jyya754ZOGIENGmIRt9qUuVdUWv7Iyj7MBdjfyd4oKohSEeekM/EHFeXk7pDavMfTcH
         9nj9uPhatfYu843u3PfzkHZDtRadtT35JwXl9lxfQmpDpoWJiB+DDZ4NZLyFGkaJVMfl
         p67SeVlzZnOpR9QNEZ6x2dameNj+188bz3vbwTqG95xqKCPSdKTAx1Pe1Qv4qRxtnBfQ
         M6f9FUc7L5sCoyhla+y2dH00+RefTT2vo8gNpLYUEyDB5Qwn6q65uq14h510h0h10Gh5
         H1KA==
X-Forwarded-Encrypted: i=1; AFNElJ8Lg80IWtvPSBuOMe1wt31Ykn4fQs63tmwhQ521VWlyzE3Aa1DBlq9dtJzXFBDyVdPvdoQimKOqKWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuK+ONBK8O1Bljlby5Or9Pls8qflMJKHHOM32FbbIEVe880Ema
	1qxhjFHHxajHjHZooDKqA8a32Vsz/E7q4WTESI0RXexhIM8iIOldWUERsDpQi+oEuY4GDCglKzc
	SO+qM3jRbTPDGpgOoVojxUVxw4Nn13zgAqOL90msMUHgwBcwB/k/sSQcNUs+ZZ+ynjGf0W7Co37
	TOllOaNIel2prGc+modyx0ivwSHKAeH5NCTGc=
X-Gm-Gg: Acq92OEekIVY+DBVzGme4kvO3mn2/QDTr2PhO0NZUobBuKI0JOSO8pVpvPRzNlQd5CQ
	rOENZjb6rGsU4jKK92dhzEo5EFnBDuMd3BvTh1Wu8Ybd9GsBTIEv8PFji8hW2/y1aCeVeoxstuP
	qBgc95QGZgV+9fs/jPMRjYZztOKVvw83GpYcrdAfj5+JGlFhp9BWtkcB5qSvBi0owI0aOrpQVVi
	kXyGu4lQzLg848nNDYfeJkQbPungA==
X-Received: by 2002:a05:620a:17ab:b0:90d:e71:8900 with SMTP id af79cd13be357-9158a656996mr831429785a.10.1780517659098;
        Wed, 03 Jun 2026 13:14:19 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:90d:e71:8900 with SMTP id
 af79cd13be357-9158a656996mr831421285a.10.1780517658358; Wed, 03 Jun 2026
 13:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
 <20260603-james-cs-context-tracking-fix-v3-1-c392945d9ed5@linaro.org>
In-Reply-To: <20260603-james-cs-context-tracking-fix-v3-1-c392945d9ed5@linaro.org>
From: Amir Ayupov <aaupov@meta.com>
Date: Wed, 3 Jun 2026 13:14:07 -0700
X-Gm-Features: AVHnY4JFl3pEAl8fmHawddLTx8dcwznZ4QTM0K2xT5DccbHgTJhDi0f-8ubPO10
Message-ID: <CAMOD+7+xeh-RNQJUUpGoV6gU3swOcpGX82n2FSNiiewZ2R3vKQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/19] perf cs-etm: Queue context packets for frontend
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Ian Rogers <irogers@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Paschalis Mpeis <Paschalis.Mpeis@arm.com>, coresight@lists.linaro.org,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: zf9bCDCJXW77yvj7aqaV8PNXtssJEFTV
X-Authority-Analysis: v=2.4 cv=avKCzyZV c=1 sm=1 tr=0 ts=6a208b1c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8
 a=W1gNf65IG8WYQCfUbkwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=gKebqoRLp9LExxC7YDUY:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5NiBTYWx0ZWRfX/VH0bDo67MvF
 Ayx5fR3z7hOUgBzCGhBlggKoX/oey8fJtUns5jD+4IR/qc9PcvZ9o1NrzDFnbPTHw6hs1Oio0/+
 Mhri7ErYKWtASgW3UUSgsDG+98kN5WkdLop/1nWKM/tAV+JowjvGeX3k3FHOfrp3ufUjMxmUXUm
 5iRDRZaXgSbg9UOAhfpY6zlQc5rc9S1lGDToAMRCK5hciIIwZgKYasG2dsT8qZ9lMwKAGykwk+a
 LlsyM+4Xn6JpgHDeetvOxwaKxFGdXjl4VmfgrflAORay5WPSCL+FXjwBEbLCYOOj0IlNO4p1BIp
 rQ4Hh+yMdCWBXAJRGGxUrl/JqQ3oZNGX2Vhg1ZU7EgoTCpqgEX9RiKRKmCpyfbHeZg+W9Ea/YqO
 +HF7cKeE0Qk5WEAQPzQ8+afVqr0l3UXmZv5QoL9+l7Yu+imcyE9DXZ3U14oGt8Nk+RAxY6XyozB
 xMOL0yGmUJPtdovjs9A==
X-Proofpoint-ORIG-GUID: zf9bCDCJXW77yvj7aqaV8PNXtssJEFTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01

Hi James,

I tested the v2 patch series and it looks good. Compared to my
stamping pid/tid on each packet, there was a minor difference in 2/39
tested perf data files: the number of brstack samples differs by one,
however, there was no loss of binary profile. The resulting BOLT
profile converted from the perf script output was identical, so I'm OK
with v2 patch as-is.

-Amir



On Wed, Jun 3, 2026 at 3:17=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> >
> PE_CONTEXT elements update the context ID and exception level, but the
> decoder may still have prior packets cached for frontend processing.
> Updating the context immediately in the decoder backend can make those
> cached packets get consumed with the wrong thread or EL state.
>
> Add a CS_ETM_CONTEXT packet carrying the TID and EL to the frontend,
> this keeps context changes ordered with the rest of the packet stream
> and avoids mismatches when synthesizing samples from cached packets.
>
> Separate the memory access function into one for the frontend and one
> for decoding. The frontend also needs memory access to attach the
> instruction to samples. Because the frontend does memory access for
> both previous and current packets, change all the frontend memory access
> function signatures to take both a tidq and packet. But backend always
> uses the current backend EL and thread from the tidq.
>
> Treat context packets as a boundary for branch sample generation and
> remove tidq->prev_packet_thread because it's not possible to branch to a
> different thread, so only tracking the current thread is required for
> sample generation.
>
> Fixes: e573e978fb12 ("perf cs-etm: Inject capabilitity for CoreSight trac=
es")
> Reported-by: Amir Ayupov <aaupov@meta.com>
> Closes: https://lore.kernel.org/linux-perf-users/20260515021135.1729028-1=
-aaupov@meta.com/
> Co-authored-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  21 ++-
>  tools/perf/util/cs-etm.c                        | 234 ++++++++++++++----=
------
>  tools/perf/util/cs-etm.h                        |   8 +-
>  3 files changed, 162 insertions(+), 101 deletions(-)
>
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf=
/util/cs-etm-decoder/cs-etm-decoder.c
> index dee3020ceaa9..26940f1f1b0b 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -402,6 +402,8 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *et=
mq,
>         packet_queue->packet_buffer[et].flags =3D 0;
>         packet_queue->packet_buffer[et].exception_number =3D UINT32_MAX;
>         packet_queue->packet_buffer[et].trace_chan_id =3D trace_chan_id;
> +       packet_queue->packet_buffer[et].el =3D ocsd_EL_unknown;
> +       packet_queue->packet_buffer[et].tid =3D -1;
>
>         if (packet_queue->packet_count =3D=3D CS_ETM_PACKET_MAX_BUFFER - =
1)
>                 return OCSD_RESP_WAIT;
> @@ -449,6 +451,7 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etm=
q,
>         packet->last_instr_type =3D elem->last_i_type;
>         packet->last_instr_subtype =3D elem->last_i_subtype;
>         packet->last_instr_cond =3D elem->last_instr_cond;
> +       packet->el =3D elem->context.exception_level;
>
>         if (elem->last_i_type =3D=3D OCSD_INSTR_BR || elem->last_i_type =
=3D=3D OCSD_INSTR_BR_INDIRECT)
>                 packet->last_instr_taken_branch =3D elem->last_instr_exec;
> @@ -525,7 +528,9 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
>                         const ocsd_generic_trace_elem *elem,
>                         const uint8_t trace_chan_id)
>  {
> +       struct cs_etm_packet *packet;
>         pid_t tid =3D -1;
> +       int ret;
>
>         /*
>          * Process the PE_CONTEXT packets if we have a valid contextID or=
 VMID.
> @@ -546,12 +551,18 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
>                 break;
>         }
>
> -       if (cs_etm__etmq_set_tid_el(etmq, tid, trace_chan_id,
> -                                   elem->context.exception_level))
> +       if (cs_etm__etmq_update_decode_context(etmq, trace_chan_id,
> +                               elem->context.exception_level, tid))
>                 return OCSD_RESP_FATAL_SYS_ERR;
>
> -       if (tid =3D=3D -1)
> -               return OCSD_RESP_CONT;
> +       ret =3D cs_etm_decoder__buffer_packet(etmq, packet_queue, trace_c=
han_id,
> +                                           CS_ETM_CONTEXT);
> +       if (ret !=3D OCSD_RESP_CONT && ret !=3D OCSD_RESP_WAIT)
> +               return ret;
> +
> +       packet =3D &packet_queue->packet_buffer[packet_queue->tail];
> +       packet->tid =3D tid;
> +       packet->el =3D elem->context.exception_level;
>
>         /*
>          * A timestamp is generated after a PE_CONTEXT element so make su=
re
> @@ -559,7 +570,7 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
>          */
>         cs_etm_decoder__reset_timestamp(packet_queue);
>
> -       return OCSD_RESP_CONT;
> +       return ret;
>  }
>
>  static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 40c6ddfa8c8d..ce570913669c 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -85,15 +85,22 @@ struct cs_etm_traceid_queue {
>         u64 period_instructions;
>         size_t last_branch_pos;
>         union perf_event *event_buf;
> -       struct thread *thread;
> -       struct thread *prev_packet_thread;
> -       ocsd_ex_level prev_packet_el;
> -       ocsd_ex_level el;
>         struct branch_stack *last_branch;
>         struct branch_stack *last_branch_rb;
>         struct cs_etm_packet *prev_packet;
>         struct cs_etm_packet *packet;
>         struct cs_etm_packet_queue packet_queue;
> +
> +       struct thread *decode_thread;
> +       ocsd_ex_level decode_el;
> +
> +       /*
> +        * The frontend accesses the EL from '[prev_]packet' because it n=
eeds
> +        * previous EL for branch and current EL for instruction samples.=
 It's
> +        * not possible to change thread in a single branch sample so no =
need to
> +        * store or access the thread through the packet.
> +        */
> +       struct thread *frontend_thread;
>  };
>
>  enum cs_etm_format {
> @@ -614,10 +621,11 @@ static int cs_etm__init_traceid_queue(struct cs_etm=
_queue *etmq,
>
>         queue =3D &etmq->etm->queues.queue_array[etmq->queue_nr];
>         tidq->trace_chan_id =3D trace_chan_id;
> -       tidq->el =3D tidq->prev_packet_el =3D ocsd_EL_unknown;
> -       tidq->thread =3D machine__findnew_thread(&etm->session->machines.=
host, -1,
> +       tidq->decode_el =3D ocsd_EL_unknown;
> +       tidq->frontend_thread =3D machine__findnew_thread(&etm->session->=
machines.host, -1,
> +                                              queue->tid);
> +       tidq->decode_thread =3D machine__findnew_thread(&etm->session->ma=
chines.host, -1,
>                                                queue->tid);
> -       tidq->prev_packet_thread =3D machine__idle_thread(&etm->session->=
machines.host);
>
>         tidq->packet =3D zalloc(sizeof(struct cs_etm_packet));
>         if (!tidq->packet)
> @@ -750,21 +758,10 @@ static void cs_etm__packet_swap(struct cs_etm_auxtr=
ace *etm,
>                 /*
>                  * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACK=
ET for
>                  * the next incoming packet.
> -                *
> -                * Threads and exception levels are also tracked for both=
 the
> -                * previous and current packets. This is because the prev=
ious
> -                * packet is used for the 'from' IP for branch samples, s=
o the
> -                * thread at that time must also be assigned to that samp=
le.
> -                * Across discontinuity packets the thread can change, so=
 by
> -                * tracking the thread for the previous packet the branch=
 sample
> -                * will have the correct info.
>                  */
>                 tmp =3D tidq->packet;
>                 tidq->packet =3D tidq->prev_packet;
>                 tidq->prev_packet =3D tmp;
> -               tidq->prev_packet_el =3D tidq->el;
> -               thread__put(tidq->prev_packet_thread);
> -               tidq->prev_packet_thread =3D thread__get(tidq->thread);
>         }
>  }
>
> @@ -937,8 +934,8 @@ static void cs_etm__free_traceid_queues(struct cs_etm=
_queue *etmq)
>
>                 /* Free this traceid_queue from the array */
>                 tidq =3D etmq->traceid_queues[idx];
> -               thread__zput(tidq->thread);
> -               thread__zput(tidq->prev_packet_thread);
> +               thread__zput(tidq->frontend_thread);
> +               thread__zput(tidq->decode_thread);
>                 zfree(&tidq->event_buf);
>                 zfree(&tidq->last_branch);
>                 zfree(&tidq->last_branch_rb);
> @@ -1083,47 +1080,43 @@ static u8 cs_etm__cpu_mode(struct cs_etm_queue *e=
tmq, u64 address,
>         }
>  }
>
> -static u32 cs_etm__mem_access(struct cs_etm_queue *etmq, u8 trace_chan_i=
d,
> -                             u64 address, size_t size, u8 *buffer,
> -                             const ocsd_mem_space_acc_t mem_space)
> +static u32 __cs_etm__mem_access(struct cs_etm_queue *etmq,
> +                               u64 address, size_t size, u8 *buffer,
> +                               const ocsd_mem_space_acc_t mem_space,
> +                               ocsd_ex_level el, struct thread *thread)
>  {
>         u8  cpumode;
>         u64 offset;
>         int len;
>         struct addr_location al;
>         struct dso *dso;
> -       struct cs_etm_traceid_queue *tidq;
>         int ret =3D 0;
>
>         if (!etmq)
>                 return 0;
>
>         addr_location__init(&al);
> -       tidq =3D cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
> -       if (!tidq)
> -               goto out;
>
>         /*
> -        * We've already tracked EL along side the PID in cs_etm__set_thr=
ead()
> -        * so double check that it matches what OpenCSD thinks as well. It
> -        * doesn't distinguish between EL0 and EL1 for this mem access ca=
llback
> -        * so we had to do the extra tracking. Skip validation if it's an=
y of
> -        * the 'any' values.
> +        * We track EL for the frontend and the backend when receiving co=
ntext
> +        * and range packets. OpenCSD doesn't distinguish between EL0 and=
 EL1
> +        * for this mem access callback so we had to do the extra trackin=
g. Skip
> +        * validation if it's any of the 'any' values.
>          */
>         if (!(mem_space =3D=3D OCSD_MEM_SPACE_ANY ||
>               mem_space =3D=3D OCSD_MEM_SPACE_N || mem_space =3D=3D OCSD_=
MEM_SPACE_S)) {
>                 if (mem_space & OCSD_MEM_SPACE_EL1N) {
>                         /* Includes both non secure EL1 and EL0 */
> -                       assert(tidq->el =3D=3D ocsd_EL1 || tidq->el =3D=
=3D ocsd_EL0);
> +                       assert(el =3D=3D ocsd_EL1 || el =3D=3D ocsd_EL0);
>                 } else if (mem_space & OCSD_MEM_SPACE_EL2)
> -                       assert(tidq->el =3D=3D ocsd_EL2);
> +                       assert(el =3D=3D ocsd_EL2);
>                 else if (mem_space & OCSD_MEM_SPACE_EL3)
> -                       assert(tidq->el =3D=3D ocsd_EL3);
> +                       assert(el =3D=3D ocsd_EL3);
>         }
>
> -       cpumode =3D cs_etm__cpu_mode(etmq, address, tidq->el);
> +       cpumode =3D cs_etm__cpu_mode(etmq, address, el);
>
> -       if (!thread__find_map(tidq->thread, cpumode, address, &al))
> +       if (!thread__find_map(thread, cpumode, address, &al))
>                 goto out;
>
>         dso =3D map__dso(al.map);
> @@ -1138,7 +1131,7 @@ static u32 cs_etm__mem_access(struct cs_etm_queue *=
etmq, u8 trace_chan_id,
>
>         map__load(al.map);
>
> -       len =3D dso__data_read_offset(dso, maps__machine(thread__maps(tid=
q->thread)),
> +       len =3D dso__data_read_offset(dso, maps__machine(thread__maps(thr=
ead)),
>                                     offset, buffer, size);
>
>         if (len <=3D 0) {
> @@ -1158,6 +1151,30 @@ static u32 cs_etm__mem_access(struct cs_etm_queue =
*etmq, u8 trace_chan_id,
>         return ret;
>  }
>
> +static u32 cs_etm__frontend_mem_access(struct cs_etm_queue *etmq,
> +                                      struct cs_etm_traceid_queue *tidq,
> +                                      struct cs_etm_packet *packet,
> +                                      u64 address, size_t size, u8 *buff=
er)
> +{
> +       return __cs_etm__mem_access(etmq, address, size, buffer, 0, packe=
t->el,
> +                                   tidq->frontend_thread);
> +}
> +
> +static u32 cs_etm__decoder_mem_access(struct cs_etm_queue *etmq, u8 trac=
e_chan_id,
> +                                     u64 address, size_t size, u8 *buffe=
r,
> +                                     const ocsd_mem_space_acc_t mem_spac=
e)
> +{
> +       struct cs_etm_traceid_queue *tidq;
> +
> +       tidq =3D cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
> +       if (!tidq)
> +               return 0;
> +
> +       return __cs_etm__mem_access(etmq, address, size, buffer,
> +                                   mem_space, tidq->decode_el,
> +                                   tidq->decode_thread);
> +}
> +
>  static struct cs_etm_queue *cs_etm__alloc_queue(void)
>  {
>         struct cs_etm_queue *etmq =3D zalloc(sizeof(*etmq));
> @@ -1333,12 +1350,13 @@ void cs_etm__reset_last_branch_rb(struct cs_etm_t=
raceid_queue *tidq)
>  }
>
>  static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
> -                                        u8 trace_chan_id, u64 addr)
> +                                        struct cs_etm_traceid_queue *tid=
q,
> +                                        struct cs_etm_packet *packet, u6=
4 addr)
>  {
>         u8 instrBytes[2];
>
> -       cs_etm__mem_access(etmq, trace_chan_id, addr, ARRAY_SIZE(instrByt=
es),
> -                          instrBytes, 0);
> +       cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> +                                   ARRAY_SIZE(instrBytes), instrBytes);
>         /*
>          * T32 instruction size is indicated by bits[15:11] of the first
>          * 16-bit word of the instruction: 0b11101, 0b11110 and 0b11111
> @@ -1371,16 +1389,16 @@ u64 cs_etm__last_executed_instr(const struct cs_e=
tm_packet *packet)
>  }
>
>  static inline u64 cs_etm__instr_addr(struct cs_etm_queue *etmq,
> -                                    u64 trace_chan_id,
> -                                    const struct cs_etm_packet *packet,
> +                                    struct cs_etm_traceid_queue *tidq,
> +                                    struct cs_etm_packet *packet,
>                                      u64 offset)
>  {
>         if (packet->isa =3D=3D CS_ETM_ISA_T32) {
>                 u64 addr =3D packet->start_addr;
>
>                 while (offset) {
> -                       addr +=3D cs_etm__t32_instr_size(etmq,
> -                                                      trace_chan_id, add=
r);
> +                       addr +=3D cs_etm__t32_instr_size(etmq, tidq, pack=
et,
> +                                                      addr);
>                         offset--;
>                 }
>                 return addr;
> @@ -1490,34 +1508,51 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
>         return etmq->buf_len;
>  }
>
> -static void cs_etm__set_thread(struct cs_etm_queue *etmq,
> -                              struct cs_etm_traceid_queue *tidq, pid_t t=
id,
> -                              ocsd_ex_level el)
> +/*
> + * Convert a raw thread number to a thread struct and assign it to **thr=
ead.
> + */
> +static int cs_etm__etmq_update_thread(struct cs_etm_queue *etmq,
> +                                     ocsd_ex_level el, pid_t tid,
> +                                     struct thread **thread)
>  {
>         struct machine *machine =3D cs_etm__get_machine(etmq, el);
>
> +       if (!machine || !*thread)
> +               return -EINVAL;
> +
>         if (tid !=3D -1) {
> -               thread__zput(tidq->thread);
> -               tidq->thread =3D machine__find_thread(machine, -1, tid);
> +               thread__zput(*thread);
> +               *thread =3D machine__find_thread(machine, -1, tid);
>         }
>
>         /* Couldn't find a known thread */
> -       if (!tidq->thread)
> -               tidq->thread =3D machine__idle_thread(machine);
> +       if (!*thread)
> +               *thread =3D machine__idle_thread(machine);
>
> -       tidq->el =3D el;
> +       return 0;
>  }
>
> -int cs_etm__etmq_set_tid_el(struct cs_etm_queue *etmq, pid_t tid,
> -                           u8 trace_chan_id, ocsd_ex_level el)
> +/*
> + * Set the thread and EL of the decode context which is ahead in time of=
 the
> + * frontend context.
> + */
> +int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
> +                                      u8 trace_chan_id,
> +                                      ocsd_ex_level el, pid_t tid)
>  {
>         struct cs_etm_traceid_queue *tidq;
> +       int ret;
>
>         tidq =3D cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
>         if (!tidq)
>                 return -EINVAL;
>
> -       cs_etm__set_thread(etmq, tidq, tid, el);
> +       ret =3D cs_etm__etmq_update_thread(etmq, el, tid,
> +                                        &tidq->decode_thread);
> +       if (ret)
> +               return ret;
> +
> +       tidq->decode_el =3D el;
>         return 0;
>  }
>
> @@ -1527,8 +1562,8 @@ bool cs_etm__etmq_is_timeless(struct cs_etm_queue *=
etmq)
>  }
>
>  static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
> -                             u64 trace_chan_id,
> -                             const struct cs_etm_packet *packet,
> +                             struct cs_etm_traceid_queue *tidq,
> +                             struct cs_etm_packet *packet,
>                               struct perf_sample *sample)
>  {
>         /*
> @@ -1545,14 +1580,14 @@ static void cs_etm__copy_insn(struct cs_etm_queue=
 *etmq,
>          * cs_etm__t32_instr_size().
>          */
>         if (packet->isa =3D=3D CS_ETM_ISA_T32)
> -               sample->insn_len =3D cs_etm__t32_instr_size(etmq, trace_c=
han_id,
> +               sample->insn_len =3D cs_etm__t32_instr_size(etmq, tidq, p=
acket,
>                                                           sample->ip);
>         /* Otherwise, A64 and A32 instruction size are always 32-bit. */
>         else
>                 sample->insn_len =3D 4;
>
> -       cs_etm__mem_access(etmq, trace_chan_id, sample->ip, sample->insn_=
len,
> -                          (void *)sample->insn, 0);
> +       cs_etm__frontend_mem_access(etmq, tidq, packet, sample->ip,
> +                                   sample->insn_len, (void *)sample->ins=
n);
>  }
>
>  u64 cs_etm__convert_sample_time(struct cs_etm_queue *etmq, u64 cs_timest=
amp)
> @@ -1579,6 +1614,7 @@ static inline u64 cs_etm__resolve_sample_time(struc=
t cs_etm_queue *etmq,
>
>  static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
>                                             struct cs_etm_traceid_queue *=
tidq,
> +                                           struct cs_etm_packet *packet,
>                                             u64 addr, u64 period)
>  {
>         int ret =3D 0;
> @@ -1588,15 +1624,15 @@ static int cs_etm__synth_instruction_sample(struc=
t cs_etm_queue *etmq,
>
>         perf_sample__init(&sample, /*all=3D*/true);
>         event->sample.header.type =3D PERF_RECORD_SAMPLE;
> -       event->sample.header.misc =3D cs_etm__cpu_mode(etmq, addr, tidq->=
el);
> +       event->sample.header.misc =3D cs_etm__cpu_mode(etmq, addr, packet=
->el);
>         event->sample.header.size =3D sizeof(struct perf_event_header);
>
>         /* Set time field based on etm auxtrace config. */
>         sample.time =3D cs_etm__resolve_sample_time(etmq, tidq);
>
>         sample.ip =3D addr;
> -       sample.pid =3D thread__pid(tidq->thread);
> -       sample.tid =3D thread__tid(tidq->thread);
> +       sample.pid =3D thread__pid(tidq->frontend_thread);
> +       sample.tid =3D thread__tid(tidq->frontend_thread);
>         sample.id =3D etmq->etm->instructions_id;
>         sample.stream_id =3D etmq->etm->instructions_id;
>         sample.period =3D period;
> @@ -1604,7 +1640,7 @@ static int cs_etm__synth_instruction_sample(struct =
cs_etm_queue *etmq,
>         sample.flags =3D tidq->prev_packet->flags;
>         sample.cpumode =3D event->sample.header.misc;
>
> -       cs_etm__copy_insn(etmq, tidq->trace_chan_id, tidq->packet, &sampl=
e);
> +       cs_etm__copy_insn(etmq, tidq, tidq->packet, &sample);
>
>         if (etm->synth_opts.last_branch)
>                 sample.branch_stack =3D tidq->last_branch;
> @@ -1649,15 +1685,15 @@ static int cs_etm__synth_branch_sample(struct cs_=
etm_queue *etmq,
>
>         event->sample.header.type =3D PERF_RECORD_SAMPLE;
>         event->sample.header.misc =3D cs_etm__cpu_mode(etmq, ip,
> -                                                    tidq->prev_packet_el=
);
> +                                                    tidq->prev_packet->e=
l);
>         event->sample.header.size =3D sizeof(struct perf_event_header);
>
>         /* Set time field based on etm auxtrace config. */
>         sample.time =3D cs_etm__resolve_sample_time(etmq, tidq);
>
>         sample.ip =3D ip;
> -       sample.pid =3D thread__pid(tidq->prev_packet_thread);
> -       sample.tid =3D thread__tid(tidq->prev_packet_thread);
> +       sample.pid =3D thread__pid(tidq->frontend_thread);
> +       sample.tid =3D thread__tid(tidq->frontend_thread);
>         sample.addr =3D cs_etm__first_executed_instr(tidq->packet);
>         sample.id =3D etmq->etm->branches_id;
>         sample.stream_id =3D etmq->etm->branches_id;
> @@ -1666,8 +1702,7 @@ static int cs_etm__synth_branch_sample(struct cs_et=
m_queue *etmq,
>         sample.flags =3D tidq->prev_packet->flags;
>         sample.cpumode =3D event->sample.header.misc;
>
> -       cs_etm__copy_insn(etmq, tidq->trace_chan_id, tidq->prev_packet,
> -                         &sample);
> +       cs_etm__copy_insn(etmq, tidq, tidq->prev_packet, &sample);
>
>         /*
>          * perf report cannot handle events without a branch stack
> @@ -1788,7 +1823,6 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
>  {
>         struct cs_etm_auxtrace *etm =3D etmq->etm;
>         int ret;
> -       u8 trace_chan_id =3D tidq->trace_chan_id;
>         u64 instrs_prev;
>
>         /* Get instructions remainder from previous packet */
> @@ -1874,10 +1908,10 @@ static int cs_etm__sample(struct cs_etm_queue *et=
mq,
>                          * been executed, but PC has not advanced to next
>                          * instruction)
>                          */
> -                       addr =3D cs_etm__instr_addr(etmq, trace_chan_id,
> -                                                 tidq->packet, offset - =
1);
> +                       addr =3D cs_etm__instr_addr(etmq, tidq, tidq->pac=
ket,
> +                                                 offset - 1);
>                         ret =3D cs_etm__synth_instruction_sample(
> -                               etmq, tidq, addr,
> +                               etmq, tidq, tidq->packet, addr,
>                                 etm->instructions_sample_period);
>                         if (ret)
>                                 return ret;
> @@ -1959,7 +1993,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
>                 addr =3D cs_etm__last_executed_instr(tidq->prev_packet);
>
>                 err =3D cs_etm__synth_instruction_sample(
> -                       etmq, tidq, addr,
> +                       etmq, tidq, tidq->prev_packet, addr,
>                         tidq->period_instructions);
>                 if (err)
>                         return err;
> @@ -2014,7 +2048,7 @@ static int cs_etm__end_block(struct cs_etm_queue *e=
tmq,
>                 addr =3D cs_etm__last_executed_instr(tidq->prev_packet);
>
>                 err =3D cs_etm__synth_instruction_sample(
> -                       etmq, tidq, addr,
> +                       etmq, tidq, tidq->prev_packet, addr,
>                         tidq->period_instructions);
>                 if (err)
>                         return err;
> @@ -2051,9 +2085,9 @@ static int cs_etm__get_data_block(struct cs_etm_que=
ue *etmq)
>         return etmq->buf_len;
>  }
>
> -static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq, u8 trace_cha=
n_id,
> -                                struct cs_etm_packet *packet,
> -                                u64 end_addr)
> +static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
> +                                struct cs_etm_traceid_queue *tidq,
> +                                struct cs_etm_packet *packet, u64 end_ad=
dr)
>  {
>         /* Initialise to keep compiler happy */
>         u16 instr16 =3D 0;
> @@ -2075,8 +2109,8 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queu=
e *etmq, u8 trace_chan_id,
>                  * so below only read 2 bytes as instruction size for T32.
>                  */
>                 addr =3D end_addr - 2;
> -               cs_etm__mem_access(etmq, trace_chan_id, addr, sizeof(inst=
r16),
> -                                  (u8 *)&instr16, 0);
> +               cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> +                                           sizeof(instr16), (u8 *)&instr=
16);
>                 if ((instr16 & 0xFF00) =3D=3D 0xDF00)
>                         return true;
>
> @@ -2091,8 +2125,8 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queu=
e *etmq, u8 trace_chan_id,
>                  * +---------+---------+-------------------------+
>                  */
>                 addr =3D end_addr - 4;
> -               cs_etm__mem_access(etmq, trace_chan_id, addr, sizeof(inst=
r32),
> -                                  (u8 *)&instr32, 0);
> +               cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> +                                           sizeof(instr32), (u8 *)&instr=
32);
>                 if ((instr32 & 0x0F000000) =3D=3D 0x0F000000 &&
>                     (instr32 & 0xF0000000) !=3D 0xF0000000)
>                         return true;
> @@ -2108,8 +2142,8 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queu=
e *etmq, u8 trace_chan_id,
>                  * +-----------------------+---------+-----------+
>                  */
>                 addr =3D end_addr - 4;
> -               cs_etm__mem_access(etmq, trace_chan_id, addr, sizeof(inst=
r32),
> -                                  (u8 *)&instr32, 0);
> +               cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> +                                           sizeof(instr32), (u8 *)&instr=
32);
>                 if ((instr32 & 0xFFE0001F) =3D=3D 0xd4000001)
>                         return true;
>
> @@ -2125,7 +2159,6 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queu=
e *etmq, u8 trace_chan_id,
>  static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
>                                struct cs_etm_traceid_queue *tidq, u64 mag=
ic)
>  {
> -       u8 trace_chan_id =3D tidq->trace_chan_id;
>         struct cs_etm_packet *packet =3D tidq->packet;
>         struct cs_etm_packet *prev_packet =3D tidq->prev_packet;
>
> @@ -2140,7 +2173,7 @@ static bool cs_etm__is_syscall(struct cs_etm_queue =
*etmq,
>          */
>         if (magic =3D=3D __perf_cs_etmv4_magic) {
>                 if (packet->exception_number =3D=3D CS_ETMV4_EXC_CALL &&
> -                   cs_etm__is_svc_instr(etmq, trace_chan_id, prev_packet,
> +                   cs_etm__is_svc_instr(etmq, tidq, prev_packet,
>                                          prev_packet->end_addr))
>                         return true;
>         }
> @@ -2178,7 +2211,6 @@ static bool cs_etm__is_sync_exception(struct cs_etm=
_queue *etmq,
>                                       struct cs_etm_traceid_queue *tidq,
>                                       u64 magic)
>  {
> -       u8 trace_chan_id =3D tidq->trace_chan_id;
>         struct cs_etm_packet *packet =3D tidq->packet;
>         struct cs_etm_packet *prev_packet =3D tidq->prev_packet;
>
> @@ -2204,7 +2236,7 @@ static bool cs_etm__is_sync_exception(struct cs_etm=
_queue *etmq,
>                  * (SMC, HVC) are taken as sync exceptions.
>                  */
>                 if (packet->exception_number =3D=3D CS_ETMV4_EXC_CALL &&
> -                   !cs_etm__is_svc_instr(etmq, trace_chan_id, prev_packe=
t,
> +                   !cs_etm__is_svc_instr(etmq, tidq, prev_packet,
>                                           prev_packet->end_addr))
>                         return true;
>
> @@ -2228,7 +2260,6 @@ static int cs_etm__set_sample_flags(struct cs_etm_q=
ueue *etmq,
>  {
>         struct cs_etm_packet *packet =3D tidq->packet;
>         struct cs_etm_packet *prev_packet =3D tidq->prev_packet;
> -       u8 trace_chan_id =3D tidq->trace_chan_id;
>         u64 magic;
>         int ret;
>
> @@ -2309,11 +2340,11 @@ static int cs_etm__set_sample_flags(struct cs_etm=
_queue *etmq,
>                 if (prev_packet->flags =3D=3D (PERF_IP_FLAG_BRANCH |
>                                            PERF_IP_FLAG_RETURN |
>                                            PERF_IP_FLAG_INTERRUPT) &&
> -                   cs_etm__is_svc_instr(etmq, trace_chan_id,
> -                                        packet, packet->start_addr))
> +                   cs_etm__is_svc_instr(etmq, tidq, packet, packet->star=
t_addr)) {
>                         prev_packet->flags =3D PERF_IP_FLAG_BRANCH |
>                                              PERF_IP_FLAG_RETURN |
>                                              PERF_IP_FLAG_SYSCALLRET;
> +               }
>                 break;
>         case CS_ETM_DISCONTINUITY:
>                 /*
> @@ -2394,6 +2425,7 @@ static int cs_etm__set_sample_flags(struct cs_etm_q=
ueue *etmq,
>                                              PERF_IP_FLAG_RETURN |
>                                              PERF_IP_FLAG_INTERRUPT;
>                 break;
> +       case CS_ETM_CONTEXT:
>         case CS_ETM_EMPTY:
>         default:
>                 break;
> @@ -2469,6 +2501,19 @@ static int cs_etm__process_traceid_queue(struct cs=
_etm_queue *etmq,
>                          */
>                         cs_etm__sample(etmq, tidq);
>                         break;
> +               case CS_ETM_CONTEXT:
> +                       /*
> +                        * Update context but don't swap packet. Keep the
> +                        * previous one for branch source address info, if
> +                        * tracing the kernel the context packet will be =
emitted
> +                        * between two ranges.
> +                        */
> +                       ret =3D cs_etm__etmq_update_thread(etmq, tidq->pa=
cket->el,
> +                                                        tidq->packet->ti=
d,
> +                                                        &tidq->frontend_=
thread);
> +                       if (ret)
> +                               goto out;
> +                       break;
>                 case CS_ETM_EXCEPTION:
>                 case CS_ETM_EXCEPTION_RET:
>                         /*
> @@ -2497,6 +2542,7 @@ static int cs_etm__process_traceid_queue(struct cs_=
etm_queue *etmq,
>                 }
>         }
>
> +out:
>         return ret;
>  }
>
> @@ -2620,7 +2666,7 @@ static int cs_etm__process_timeless_queues(struct c=
s_etm_auxtrace *etm,
>                         if (!tidq)
>                                 continue;
>
> -                       if (tid =3D=3D -1 || thread__tid(tidq->thread) =
=3D=3D tid)
> +                       if (tid =3D=3D -1 || thread__tid(tidq->frontend_t=
hread) =3D=3D tid)
>                                 cs_etm__run_per_thread_timeless_decoder(e=
tmq);
>                 } else
>                         cs_etm__run_per_cpu_timeless_decoder(etmq);
> @@ -3328,7 +3374,7 @@ static int cs_etm__create_queue_decoders(struct cs_=
etm_queue *etmq)
>          */
>         if (cs_etm_decoder__add_mem_access_cb(etmq->decoder,
>                                               0x0L, ((u64) -1L),
> -                                             cs_etm__mem_access))
> +                                             cs_etm__decoder_mem_access))
>                 goto out_free_decoder;
>
>         zfree(&t_params);
> diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
> index aa9bb4a32eca..b81099c2b301 100644
> --- a/tools/perf/util/cs-etm.h
> +++ b/tools/perf/util/cs-etm.h
> @@ -158,6 +158,7 @@ enum cs_etm_sample_type {
>         CS_ETM_DISCONTINUITY,
>         CS_ETM_EXCEPTION,
>         CS_ETM_EXCEPTION_RET,
> +       CS_ETM_CONTEXT,
>  };
>
>  enum cs_etm_isa {
> @@ -184,6 +185,8 @@ struct cs_etm_packet {
>         u8 last_instr_size;
>         u8 trace_chan_id;
>         int cpu;
> +       int el;
> +       pid_t tid;
>  };
>
>  #define CS_ETM_PACKET_MAX_BUFFER 1024
> @@ -259,8 +262,9 @@ enum cs_etm_pid_fmt {
>  #include <opencsd/ocsd_if_types.h>
>  int cs_etm__get_cpu(struct cs_etm_queue *etmq, u8 trace_chan_id, int *cp=
u);
>  enum cs_etm_pid_fmt cs_etm__get_pid_fmt(struct cs_etm_queue *etmq);
> -int cs_etm__etmq_set_tid_el(struct cs_etm_queue *etmq, pid_t tid,
> -                           u8 trace_chan_id, ocsd_ex_level el);
> +int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
> +                                      u8 trace_chan_id, ocsd_ex_level el,
> +                                      pid_t tid);
>  bool cs_etm__etmq_is_timeless(struct cs_etm_queue *etmq);
>  void cs_etm__etmq_set_traceid_queue_timestamp(struct cs_etm_queue *etmq,
>                                               u8 trace_chan_id);
>
> --
> 2.34.1
>
