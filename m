Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD344BEE52
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789301294; cv=none; b=tbKyXv3aGX/T/tl8tiFumpYeWXTE+EDfYu7YupJHzUmjmcbgWF5O9kT4jnYkMyKUL79wRxmRcgDbxgMwLC6S7D4I9s6nmZgUs7fSecxrm5IEFFo9si0GOjMFvk7JEhuXUo8aE39EEBl8hX7Jj56+ntmjIHmJy3MtcQtuEDkWRbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789301294; c=relaxed/simple;
	bh=KNlvNGvxQ2hrf2oBkBliX0eBjTI83KiOoFJQuV0zvhI=;
	h=Date:Message-ID:From:To:Subject:In-Reply-To:References:Cc:
	 Content-Type:MIME-Version; b=cH4alZjZ+p5b/UDjB+1LIPw/yxW4FtoRd8z2P1IRTMSNIIpgA1b/Kovqt5RFNgGdY6ioz0/kzpqVLRbVDvCt+qHhBtC6ADYiQ+slLEqA7W07RilmrN4DuXY0pFUVsXph0BFzy5lWHynUZZxbaOEQodIMyectprpPCfzuYEbHUp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRNGUjTy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vw6riFWa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRNGUjTy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vw6riFWa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DATv5c2052422
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 12:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRKYA9mVvempr/6gm9Uvztlav9Ha/BqjYUGbx8YbOLc=; b=lRNGUjTybCpU8/ls
	t2LZ/yoEe5tS2rXBKnFB08ZrP83cyeUW5gOG1M91fjTq16aWG6nH4SBKV6a0+fgC
	9PzRcKqQS1Jw76cdYX8aoUhIjF/3naOrrCKWiuB72YmY/2EJS8lKfXuGHco8meaq
	QZUzPZYfrmwAizFGEuVAExAaKiN+JJ17v8T+H5XqwxEV0ao9Uh6GdnU2uIemvKI5
	f8vC6BRYRLegF85n6zEFjFBsZ9Rq+AbnuO6dQwKJdIvimvYRWwmour3hAv+1kjsA
	F7NdypkPTclqBWQjQkZtZ8UnKV4nwirkOpjym8FpEk0blUHPr/XD+iG/qVD9y0Zp
	Xst1mg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dk66v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 12:08:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8696b921ac0so3844050b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 05:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789301290; x=1789906090; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:cc:references
         :in-reply-to:subject:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRKYA9mVvempr/6gm9Uvztlav9Ha/BqjYUGbx8YbOLc=;
        b=Vw6riFWapa/RiZ06+kE6x8O9RcdGIivON15bzbfKezPLWl4mUa0V+pb1+9NTciVawF
         tsDr+9p/Qhphl4I5dVp+1ctLA9ZnEuMXzuttfdzV6xcJc81DFdaOpHSV/UfvPQG1tVsl
         Uwvenf3xMNdFo+To3gaMk7ZzhTrJui4lAM9sS2wjZ9TCX9bxTINvwvfL+mUhCNiZUoCI
         If2TAXygZjF3+Ez4C8U/x6lNqYEsZBqWeRODIRVIfWZuCz+fkVMj9CvFjal/AOJgr9qi
         DeqElSyPeKS537OMHScGBp9a6yagoSrsnmpmm6uezE/cNa85B0MZTR1aY1+KmFIVoqT0
         xm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789301290; x=1789906090;
        h=mime-version:content-transfer-encoding:content-type:cc:references
         :in-reply-to:subject:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRKYA9mVvempr/6gm9Uvztlav9Ha/BqjYUGbx8YbOLc=;
        b=R9EAJuniEPT9ewKZ88RtLZQ/MwrjKVLHoML9buwljeS7h0v4Dl6m1Dmc8cZ1i7br9N
         hjaFhYDqZmOs7rBpeCUn6mDBGTyKdZRdR7euB3qjRmyuJhgP6E1CWI+s/O8NwzasqN61
         I7gZ7xzZYH95P7Epz88r8IEeRwioH6zvwda2Ex0w1U/imW92fmvB2ycIk5NLwglmCYi/
         S3MeHKlSsU/2sMCDVUo0RdIv3SNwiZYNSwCb9jCDlfKC+xTuEy3Hyle9VyMcqQj28PLO
         DOen+k/LN3Qbjus5hqJqoh+p2B1ZZrAv+OgMJPBVKBFz49n7W50Iv/FrHZVt8EEGscqx
         ZTPA==
X-Forwarded-Encrypted: i=1; AKwUvBzCJLvRPRV8xoiy4C+3bC+igcx4twmS3IHyxewb7BWUpLTpadrZ043F34iTEXVJQK+OZDt2mD7R2Rc=@vger.kernel.org
X-Gm-Message-State: AFuF++lSXhPqgfpqCw9gNLK4otwLDQnnkbWVkXTf7X6Tkss8ZyqplnKO
	UPIPtRNQV8sh0oPhmmxzxbO4dS2wKL3y7nj09ngWCAkF/3MM3nQP6DpbYZu0JPZX7qTMJMYDky4
	AGgP3fSuhESzUPFc/FrES6HwaNDDgQKiUSMkaUkeb3VxDRIYq55QhPGwcBPt/RwA=
X-Gm-Gg: AYBFou2EqmlNMYBRJDGgFhGUaPmJh+uD2MJsODVd2sAjcixgjyMoknN3p5A0qCVYoLJ
	wWzZ9AjY4ZdIBRwQdsmiqL/OBMOXihgaUYiPwqEeOAbiwah0aQX4F5df1OrGJfZRuDWz86NgLD2
	1qH7vH/WxG8FFaEL8M8O3bywDa1fO1XH3hRoQKVNHoq3OdN6QQnDai+Cdd1AX7Hll4bI2JzMn+8
	S+faVqxSeq3oT8R+d5tBuxXDJn2CDMHJtzBa2ShjIxREg6LmDaI6IgoeC1/8EsdBGJD0XfB4aHD
	TF6XD6jcTs23xx3UWTg/ZNXnkXM2ztvtNrjppxvQ12dhLmB7X72qcN62eA==
X-Received: by 2002:a05:6a00:3d01:b0:85c:2d83:bbf1 with SMTP id d2e1a72fcca58-86ccb44e113mr10858295b3a.20.1789301289858;
        Sun, 13 Sep 2026 05:08:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d01:b0:85c:2d83:bbf1 with SMTP id d2e1a72fcca58-86ccb44e113mr10858220b3a.20.1789301289287;
        Sun, 13 Sep 2026 05:08:09 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b5062c60bsm3183947b3a.22.2026.09.13.05.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:08:08 -0700 (PDT)
Date: Sun, 13 Sep 2026 08:08:04 -0400
Message-ID: <b811b28d52275928699251b0b064a642.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Subject: Re: [PATCH v3 2/3] riscv: hwprobe: export the availability of
 vector to user
In-Reply-To: <apGwuxgYZsZHiB8o@Tao-Chiu's-Mac>
References: <20260725001614.2578617-3-tchiu@tenstorrent.com>
 <20260813233854.86799-1-mark.hsj@gmail.com> <apGwuxgYZsZHiB8o@Tao-Chiu's-Mac>
Cc: Mark Harris <mark.hsj@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>, bergner@tenstorrent.com,
        kito.cheng@sifive.com, dfustini@oss.tenstorrent.com,
        greentime.hu@sifive.com, Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        Xu Lu <luxu.kernel@bytedance.com>,
        Yao Zihong <zihong.plct@isrc.iscas.ac.cn>,
        Jingwei Wang <wangjingwei@iscas.ac.cn>,
        Deepak Gupta <debug@rivosinc.com>,
        =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: hcG-1kcKwcGTlruVIt8E8ldl3Z1JZMBG
X-Proofpoint-ORIG-GUID: hcG-1kcKwcGTlruVIt8E8ldl3Z1JZMBG
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa6922b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=qudAywcBR2F4KdnsAu4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3MiBTYWx0ZWRfX2fN7I9XihFeD
 Z778qlSx0/nnOd8cQWvT4TeNDKp557CV/qlZIjkPxD7b8j0QMmFFLE2ctH+iKPUtxnsTOToZA/X
 SHllS/c1tuygwpOvYoj6s1yCnjfQeHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3MiBTYWx0ZWRfX5JXTsoPwEnNY
 UXpcRHQDEiNdN4j4/uouS/j0PO7YG7JEqQ7w8A5+qJgH2DX2rceuj2/CC1DhFMYDc//hLgGomCz
 F2cAr9fs4i9vITRHgm+eoUVMusAiPISiTcPTZsxSMhXPB+MhmLs4tzuRuiDfVh7XXd+ue5m2Qd7
 qTCFHWHA+HQFPkogE+IoWmDaLts5xAuy9zedKaWaVEGWDLO38gSfg1Kb57zcGunLpKbqvzPC7ZA
 Rpr6crwlEFIG6uHL2T3CaH60fbHSBWnMUoD27ruPNv2Jl9NVWNvw2pG0gk9Ztw1w3osuflQhfCg
 aY54pfcrtDfW+i73AhfgzzRNzYPeUPJdpv1ee9W+Swbz0oPseLpeSGoN6A1AD7zcfr1Xbiji2Tb
 YqniTbChgBl7iJjIUFyd9Et/s8ebuFRG483SFu9D8QE2o329E10KFnl+/FIxUzOlaf0SctlxU9a
 lIKH5ILkZG6IPyTtyyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130172

Hi Andy,

On Fri, 28 Aug 2026 11:00:59 -0500, Andy Chiu wrote:
> On Thu, Aug 13, 2026 at 04:38:54PM -0700, Mark Harris wrote:
>> > Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
>> > no value of its own. Within a single request, keys placed after it report
>> > extensions that are both present and enabled for the calling process,
>> > while keys before it keep reporting hardware presence. This masks out V
>> > and its V-dependent sub-extensions when V is disabled for the process, and
>> > lets userland obtain both views in one query:
>> >
>> >       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
>> >           present       modifier       enabled
> >
> > [...]
> >
>> indicate that existing keys should be reinterpreted in a new manner.
>> Using a key as a modifier with no value and changing the keys to
>> be order-dependent seems like an unnecessarily confusing ugly hack
>> that we would have to live with for decades to come, just to slightly
>> simplify code needed in the short term to handle older kernels.
>
> [...]
>
>> Because ifunc resolvers may not have access to external symbols
>> beyond __riscv_hwprobe(), it is really attractive to be able to
>> obtain extension availability information using the same function.
>> But that doesn't mean that the kernel has to be involved.  The
>> function is in libc, so it could call the vDSO function and then
>> optionally modify the resulting values according to its own
>> process-specific information about enabled or disabled extensions.
>> This extra information would ideally come from the initial hwcaps

It already does, and I can be more definite than "ideally" here.
ld.so invokes every ifunc resolver through elf_ifunc_invoke(), which
calls the resolver as resolver(GLRO(dl_hwcap), __riscv_hwprobe, NULL);
dl_hwcap is AT_HWCAP from the auxv, which is ELF_HWCAP from the kernel
riscv_get_elf_hwcap() who already considers the prctl V ON or OFF.

glibc's RISC-V memcpy resolver receives that argument today and ignores
it, keying only on hwprobe IMA_EXT_0. So the glibc-side fix is to consult
the dl_hwcap argument the resolver is already handed: no new kernel
interface needed.

Refer to glibc.git, sysdeps/unix/sysv/linux/riscv/multiarch/memcpy.c
  select_memcpy_ifunc (uint64_t dl_hwcap, __riscv_hwprobe_t hwprobe_func)

PS: I briefly verified this solution can work using QEMU.

> Unfortunately, I think the riscv community has decided to stop using
> hwcap and move forward with hwprobe. Although I agree with you that it

If you can clarify what 'stop using hwcap' means, that could help a lot.
The policy I know of is that new multi-letter extensions are exported
through hwprobe only, and the policy doesn't say user space stop reading
hwcap bits.

From what I can see, hwcap is still in use, and with new single-letter
extensions being ratified, hwcap is being extended as well. Like 'B'.
Andrew stated the policy on his RFC: "If RISC-V defines a single letter
extension, such as V or B, then we should add it to hwcap" [1].

It's true that ELF_HWCAP only carries the single-letter extensions,
and multi-letter extensions go to hwprobe. But here we are talking about
'V'.

> is a convenient way to add such per-process's extension enablement
> status.

For V in particular, AT_HWCAP is already the per-process view. Your
own commit 50724efcb370 ("riscv: hwcap: change ELF_HWCAP to a
function") clears COMPAT_HWCAP_ISA_V whenever the prctl state is not
ON, and Documentation/arch/riscv/vector.rst still tells ELF programs
to read that bit to learn whether they may use V.

>> (which reflect the vector prctl) and any tunables, so it is
>> process-wide, can support arbitrary extensions, and can be checked
>> without any kernel syscalls and without callers having to know or
>> care whether a particular extension can be disabled.  If the prctl
>> was used to re-enable vector in some thread that may not affect it,
>> but that seems like the desired behavior, at least for ifunc
>> resolvers, since they are assumed to produce the same result in any
>> thread and at any point during the process lifetime.
>
> [...]
>
> I think the argument comes down to: do we expect the mismatch between
> an extension's availability and existence to grow? Using the same set of
> keys sounds like a good idea if we expect more extensions comes with
> per-process enablement status. On the other hand, if future extension
> supports come without the ability to turn it off, then this
> implementation may be an overshoot.

My position is with Mark: a positional modifier key is the wrong
shape for hwprobe, and I don't think the kernel needs to change for
this. For V, the per-process answer is already in AT_HWCAP, and
glibc's resolvers should use the hwcap argument they receive.

If a second extension with per-process enablement ever appears, that
is the time to pick a hwprobe flag or an independent bit, as Palmer
suggested. Or a solution based on glibc tunable as Mark mentioned.

[1] https://lore.kernel.org/all/wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t/

BR,
Guodong Xu
