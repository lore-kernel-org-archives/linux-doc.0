Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257771;
	b=BSRI9XltTVaJ2faDE7/KQ03UBl7iK+gs4wKFtESkfqMbNdFwjnoUtG8YrHYUzlE4ZS+O
	 yWN180bdpkOBteNVIvtBG2R0JMLDXv1t6qhghed3tVnsa3HvxriI74vJKsCC/yZ0/0RaB
	 sxGigl8KTYx5KZdYiNEEb46vpIXu/Y+OBqTovzxMmjg1g/vQq16X2Pw8+afy7sdbVZa1O
	 ysbzgR+TFbNXoU8zFq5cVplqzyaoJ7z8ir5f+Y7d+sZy+oUJKeQXO38TzWBGHJARVw3AT
	 PKe8SckW7rLy6FOVhjxw8eIm9s48tk21t52djjVjNtMo+TC9mxI/r+L8QaL/jomVuCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=;
	b=ngPv2vKwZEksNuB6D7+rHGgg8UgQfuLczm+UfDH/nx+SUoG3oLsrL56NVhE4lCBhIWpN
	 7Op+2pcU573d5EqY/wa4nfXeETXepW61RT9qTVfJHCAO8XMS5JxTHNKf715wpS/gx2bis
	 PLvoGjBA+jc6auegivYTNxse/i8p/j2ycPJGpeS2NC7UugHK7GTIYz1BfFIOIKiIfB4oq
	 1YzEItb0Ce8fxTv/ORssuuo26SxjfdPDahH1JFiQyYJHIW9yQHBaMiXr7riIR7wqpyYlc
	 5iyRn+B/5dOg6cxg7zKDYUad3Nj/mQq8T3jEuS7FnLzgeunbLvx7B+h4iy1/2YGBHUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WWNiY/VA";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmGiNTg4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2B606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 07:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA2B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWNiY/VA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmGiNTg4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H6HD3282398
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 07:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=; b=WWNiY/VATgyYMqMt
	kWCFCPZNmeAuzOciF9qUfhoFxfGyr4tnHwXRaiqfTMEuEnbH9eqP+T6hQRblF+T1
	erZfkl44iSRBXVfyF5ZdHmp+V84AO2tlhjCF2PrBjIvJhxoUvFb4F5LmYyscYYz+
	PbdGAr+J4FqOnIpq83+VwbKA933OGl7DZLV9WrX5SX5U56XPy7JA4HAM6TXHLxe5
	sxW0GauZtTQA1mizjVmlGw0QhlAWChW5IMVGTsx4uHOHfK+uB7dfSoNPHVmaktQ2
	TEbS5NZTFeh46Bcd4auuuu5kOcCWvyLlHXTld4rfSz1CyCO6wQDwEsEPTGhj2AwB
	JKULKw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgptcc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 07:09:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a26fe9521so546254eec.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 00:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793257769; x=1793862569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=;
        b=AmGiNTg4giKJshMAtf6PaJVe0x74bg1wmRbssHcp7tI/v3m28U9KonmV7heEcNJ9DU
         Yvw2uIFnScfqAGJMFn8EVXg1gsTbycM200i4g+spS2C9oO3H7JwmwBnaRWekFJ4C5fJS
         1Srk5KgFVUmLGOkuEZnKoWEARy/a5wy3+7M2n+EeJ1ikIzNlfyS61NyebeXpw29DV8ni
         r3B7fGOYHO6Ua75BBZ3u1Bpb/B0q4fUxVSj+ax68ty0ueLPsUQzhomjBbk7mgPEWvMtP
         h6wVJ8nbGmsgo9HmD2u7hSYnB/TjiudsidkZgdFiVfozRekrr6symlvYh80ALqAZn5Pr
         oJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257769; x=1793862569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=;
        b=hez/w2CTUrYLYd5RtBZ8HgQ9oOvVHXh1h561swWYZIOZDzsjztUIUoy+Y7nA8PRK4z
         zYmv3+V3niZhNf9Wzu0LWDwYDl3Vkt/lGrbwCkdthbtJcuYv7DUW5U+MGBV9sp2I50vB
         Ed+KUrO8U0Pju7ETtWEJ0qKdX+gK3EAWFFWXb4ReBeANx5o6pGR4c7emLr7xubkaGUcE
         fKl3Jp/rfTkeNlPSY6XiTYl05uqZYXbuYRIDr6eauAc6FTp7Qcq3g0469kLnafeQS2Ow
         SXX5q8eK4ijlA+Fa3TohGzTWDs1LEjcf9wm2543FywwzWmDa2ix2BAq9EBF/72WU/Y3l
         kSoA==
X-Forwarded-Encrypted: i=1; AKwUvBxAJflXMth+P1vYM+GwD2mgH4cJgpD+tvQbfg3CHXz0BkKcP0kz/db963BKPnd1fClsT5xxMHzWamI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBt7xYL8+BN2bZ69a4pCvpt5NsX6lVLe9YMbjwHwGVwH/l7eQI
	yd1Hqa4ygJACQa4RknKr3utja4GTI/HxlYgO4M2U0m8Rcq55uvX+i8639e+mqJLXCo/5ZG8A634
	6g58qA4VLpRHMuTz6boNv48y8SHKyGuhtLacpO47fsptshsVLPsQfSlcZwstK/BA=
X-Gm-Gg: AYBFou2MXCTiEuDzBrn92sm8q3OnD1Z6BnavyBdOhb6bUg2sI4bloXtbuzRHppIC/xL
	/jKqkFJxQIpiHd+XnW9PZ1aMXd5MUNJnf8Vo7nkxXrCAKJ6H5kinvHRUoORZXTYD2nn9jaayTgr
	mHTOGdAHSwsivm9rxox28TnMxSz806fb9/hExq1plQwBu3eol85UynaQGYVBVyqU3Bi6BOf0bsI
	5NsE89F3G+QAN8lqkU/diYYr4YV6zAqeB06ELQbtppNmlfUYnwB4mIwi7iX3gRogDjZIKupU1H7
	IIoC173PTltNUbi+JkyQbLW9IDuId9ytdMfd+wNtt8M3f3AoUtYkVSVy/ZqYTz5X1H16FWMHNW+
	q8Vf0AB3XHzD95U5Bqu4KapcT9KtipjnRO9sIIEa/qpUx+OBSwGNJ2hbMSM9Gni5hbXf39H0e+0
	LCrqVeMZ5yW5ph6Jj4m57cCZWYVl+JSNuRGzFb+ppAbqA3z4uzQk5DacWdTQrKJJgqTt7jKoGjH
	A==
X-Received: by 2002:a05:7022:fa7:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1a944924513mr3514463c88.15.1793257768831;
        Thu, 29 Oct 2026 00:09:28 -0700 (PDT)
X-Received: by 2002:a05:7022:fa7:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1a944924513mr3514415c88.15.1793257768069;
        Thu, 29 Oct 2026 00:09:28 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a760569d53sm12372655c88.23.2026.10.29.00.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:09:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:39:16 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>
Cc: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        Paul Walmsley <pjw@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Alexandre Ghiti <alex@ghiti.fr>, Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
Message-ID: <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
 <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
 <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyNyBTYWx0ZWRfX/rDNOT0hf0c2
 tPnCRL1qxuVxpMa7FqZxPffFcF8h2WygU2uUnZ8uB3XD1oygxteGCDzGtzE9aA+DYrbFg5y8Px2
 pVD9itpHVD4dNAJzFGfjFu4B0hzhTA4doKj33/3rlkw9rqfc/axKe795OG7hLuEeH7LgQw7ZdLX
 J27WjoDhA6zXsbUUFP7tuXC8MxdUTT99D57tfRkjHTRzbYecSnDyzhjMU4BYTFuT3YW9eVuwKlx
 1nCXaZN/3np6mOC9hwQYf6idPnqDc66dhtpB6GiRM8UcWXhw7oyJI4VvMzwanylsTjt+mGy5Uai
 wMCERv7cRO3aah+TR/VjZdkbmRwcVh9/mhrBoFkO1zESCayLMsnFM3Lo/+uuvQzb8rJCSJWh3iZ
 nbecLRGN3x8W57gGeRmffD/vAFc4mpZ/tUMGdYlhL6uws+hYZ9ORdoHNL8Cc91ag5RzygpLNrWT
 Zb/2bzZu3vv9LgpHqnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyNyBTYWx0ZWRfXzVTgNtoWC0Cl
 q9oe56ianpLNAeYCsPyDZmla4ur5yDGxRI4aHcUqOF8h3r1x2JTYsVHUncEdFGFWxoiC4tp3NM5
 cHv2qjkLtQYOVx1qVhkkzQyMw57mQdg=
X-Proofpoint-ORIG-GUID: uDzpE4BBHcuY9g8D9NT7gTbNDI8Muy_1
X-Proofpoint-GUID: uDzpE4BBHcuY9g8D9NT7gTbNDI8Muy_1
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae2f12a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=lYWFnMbivg8TxhJFMxEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290027

On Thu, Oct 29, 2026 at 11:32:36AM +0530, Anup Patel wrote:
> On Thu, Oct 29, 2026 at 9:10 AM Zhanpeng Zhang
> <zhangzhanpeng.jasper@bytedance.com> wrote:
> >
> > Hi all,
> >
> > On 10/29/26 11:17 AM, Anup Patel wrote:
> > > On Thu, Oct 29, 2026 at 8:36 AM Zhanpeng Zhang
> > > <zhangzhanpeng.jasper@bytedance.com> wrote:
> > >>
> > >> Hi Anup, Paul, Himanshu,
> > >>
> > >> On 10/29/26 12:55 AM, Anup Patel wrote:
> > >>
> > >>> [...]
> > >>>
> > >>> Changes in v11
> > >>> ==============
> > >>>
> > >>> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65cee).
> > >>> Also, tested PMU driver with both PMU irqs and PMU SSE events.
> > >>>
> > >>
> > >> Thanks for rebasing and testing the series. I was a little surprised
> > >> to see v11 posted, as I am still working through Himanshu's v10 review
> > >> and validating the fixes on hardware. It would have been helpful to
> > >> coordinate before reposting so that those changes could be included.
> > >>
> > >> I guess this follows Paul's request to rebase onto riscv/for-next.
> > >> However, there is one change beyond the rebase that I would like to
> > >> clarify: why does patch 4 remove the scoped_guard(preempt) sections
> > >> from the CPU hotplug paths? These were present in v10 RESEND, and
> > >> the local helpers still retain their preemption-disabled assertions.
> > >> Is there a reason this protection is no longer needed?
> > >
> > > Yes, this is based on discussion with Paul yesterday.
> > >
> > > This series is blocking the whole RAS ACPI support.
> > >
> > >>
> > >> The changes discussed on the v10 threads are still outstanding in
> > >> this posting:
> > >>
> > >> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
> > >> - Replace the temporary GUP-based perf user-stack copy with nofault
> > >>     uaccess, following the x86 approach.
> > >> - Address the per-CPU initialization/preemption concern.
> > >> - Split the MAINTAINERS updates into a separate patch.
> > >
> > > There is always going to be new updates since it will take
> > > time to harden the SSE implementation. All these changes
> > > can be done as separate follow-on patches.
> > >
> > >>
> > >> Additional fixes from Sashiko review, the kernel test robot report,
> > >> and our follow-up debugging are also being consolidated:
> > >>
> > >> - NMI-safe entry and lockdep irqflags tracking.
> > >> - The unused-function warning reported by the kernel test robot.
> > >> - RV32 vmalloc synchronization before nofault fixup.
> > >> - Faulting-PC validation in the kprobe single-step fault path.
> > >> - Per-counter STOP handling in SSE error paths.
> > >> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.
> > >
> > > Same comment as above, please do this as separate series.
> > > No point in holding all other dependent work endlessly.
> > >
> >
> > I agree that we should unblock the dependent work. However, I would
> > not characterize addressing a known, reproduced issue as holding things
> > up endlessly.
> >
> > >>
> > >> In particular, Himanshu identified the missing preservation of
> > >> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
> > >> I validated the fix with hardware A/B testing: removing it reproduced
> > >> corruption, while the fixed kernel completed the same test sequence.
> > >> This also gives us a solid basis for replacing the temporary GUP
> > >> workaround with nofault uaccess.
> > >>
> > >> Paul, please hold off on taking this version into for-next until
> > >> these fixes are included. The rebase and PMU testing are useful, but
> > >> there are still outstanding correctness issues.
> > >>
> > >> I will consolidate the changes and post v12 against riscv/for-next,
> > >> with an updated changelog and validation results. Let's coordinate
> > >> the next posting to keep everything together.
> > >>
> > >> Thanks,
> > >> Zhanpeng
> > >>
> > >> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
> > >
> > > Regards,
> > > Anup
> >
> > I'll post a focused v12 before this weekend with the immediate
> > correctness fixes. Further improvements can follow separately.
> 
> Linux-7.4 merge window closes end-of this week so your v12
> will be too late for it hence I suggest sending incremental fixes
> separately.
>

Hi Zhanpeng,

I agree with Anup. IMO, SSE as a feature is ready. It will be easier
for you and for me if the patches are merged. It has become a pain to
send revised RAS patches because of the dependency.The issue that I
identified can be sent incrementally in coming weeks.

I would request Paul to pick up the SSE patches now.

Regards
Himanshu
