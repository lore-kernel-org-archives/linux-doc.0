Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFBAEAC7
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769548722; cv=pass; b=FpfwGwqgIhIXn3p2QnPY9xXReovs/K1I5Z9QWeDbe3s8MgjxJdtl1EKfLv4NPdL0S5XjXbm8+Tq6r6mh7BMQuV9yf0GBHX/WQe0s7eEqjElystFS2mZwwQ0tQrVPYAnehz9QaUU+y7R0Z8Izro3ZZJot1KVUt8JwhXbLgWdGlTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769548722; c=relaxed/simple;
	bh=X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceScFn2OhOwtNrPzDo3x5d8Htd0JUpxkxRMux3HOaqWjGA0JlEL2+tkzR0ld4vD2NGrZxJSl797zwZIo9yYEyWouIMNVzmSBiOWPqez7jBGI/ASR1c0REsnYWpaUHR400/nbWBjuuw9GdDSjHnYut4Z50/5IpKnG5XW+X4WMnEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9WLKFWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mfp1T3Yz; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9WLKFWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mfp1T3Yz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60REZfaG1065900
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 21:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=; b=j9WLKFWvozf+8CGo
	9+U20akPC6tPn2FKyBB4pUXi8XGRGIfXA0xT1tdVbbHFxhi9SQeAimmrngPl0W9K
	cMs17T8IrYMsJ8Op+E8KSPEJ09PpL+NViYNVOxEPrwoX4JIx9kHIeBv0VctFTLNF
	ws9pggWNOB7xPAeF800NQWlIRbHAvHsU3SsBHFkln1zb/LqUJNEiymqCeTn+Xnm/
	0TGd2sk5IysmfT+HHecAOFPLkzY6k5aU01c/UN+vniidd52wq1iMq90hirCR7MXS
	fFAkodhOIrCDFqO+keMW3JJzAbbV6EoZ7nov62h7STehPPkuVXij5gt+hOAeW/yY
	cIBH2Q==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x1cry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 21:18:40 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6465127b47dso8236030d50.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 13:18:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769548719; cv=none;
        d=google.com; s=arc-20240605;
        b=HttgqbnShdEqzAG8dyFuRYviuoq2AGWJIkrzKYrJT6ly00/HLBMc+/bGrLdbglbqkg
         MW6jiM2IrumHbAFoVr4WFvabFa9+nDxaRbZmsASJaFmPp9XH2fZBGnVP3UJ1DmvO8agF
         HTpzJf1+hoWkvBd1N8WCxhtppoXufvWM3rglXx5/mK847pknekwWObET1aIMR/8iX0tO
         JOmh+AuwfdUo92XF9+/PrNOAO1sUpg/+YrUGoyAEWjTfcSiBKr7SFkD0lrYsBnLX2fDr
         TzKuSMYu37EY9Dt68xZSbsm0KDDI/8gJ1DesD7POg5gtYInerzVQs7dAtvKhdpo7/aO6
         8mZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=;
        fh=eBdttTinoBvpOpfMfJoMCDYopJ6boAMfT9To2MNDIrA=;
        b=gWPfCOCmicPlzb69sa0xvacCoe4cmPWOaVklfBDu4PXAlmR3Xuv+sOlpSQgNPkroc3
         4x9BZcrbbwVlCPRwvd5ctaiHCgXvezRM+27QFBDHTQLYVrA6R5+Tu93+U2luN41jpnn0
         0nX03eXWCfZCv4HD+GvSGXwt/uXcTdKRRbX8JLhCathm507bZzRI2OQuKgVccw2pgdX5
         1o3zxHMoBHkFVAtbZQ+C11I2kjAD8zQozqIwPgpQnymmPyXqb2rhRfnOpUGT2v83MqA3
         2Z8iuHRj6B/iwktpZBRHap9rxIJFvbbxo8sJwpAId1MhwBPZO9c0L8udGbYSDk+iQm+T
         4iZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769548719; x=1770153519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=;
        b=Mfp1T3YzTOQJogvremUaBNPzl15fAFxjeMRjEkYD7euB9hKPDcBBShFgw7S/EYqzyY
         Vey/shT9BitUTW1ntYUcPBaieNnTifeBbeoh4c5jHEoNkD8OlBwqfJdKOPSLo/zgBfaI
         d7G5Dml273u45klOvl8KbH68IwvM653U3innINCdTCARWC6HUCotAD3DyLlV9O4zEfd9
         jT5bSlitSQYkH8czPzVO2V2j6juOXwoCwQdnK981wzT5dA3Y9Y6+5Kz+TC8ed1mF7wFw
         /+34fzVODyV/AW142P2jMVNSl5bkdN8JZS7lrDEt/AqMJTni+1C1h8ACh+iGQa/japsN
         zI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769548719; x=1770153519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=;
        b=TVhBqTdJ3YhWs3fqAMqPEixBF0uxavtF6PxnU6fDZJqK2z59ZmjwURfY/VOYIxuqNF
         XIRJmGMIYENTwmEGcplThsGfzRin2kcWqmoSVOVd9KnYyNANj6ReccXTcdpLYa6jbNPF
         dR8nxFHKDPfh6FIzKIe2SiYoZJWLmIIxGo1Ftu9ZKDRjtipexNrOJ5m6fHljOtSYB7Vg
         67V5dDaiGP4MicrTf04+5+9PklDaXaP8ddJtM7ARm2L3wVuxeeiJjhB5DG5ITUR4gZZw
         64nVPtqhXMOV0D2obz4DkLjpJyVCYOnB8cvYJ7IrfJrtAVFADU6VIE3dJq6qE5Ngvplb
         7UdA==
X-Forwarded-Encrypted: i=1; AJvYcCXI8vmuk388L8ooJmKTypHCfD/28SUgJTLjIl75JEldXE6zlb6sG+Ik9xHQGLi1GcQQMI6OnNsrr5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhbzM/5unWKfUb9LRKGfc/QSHej7WLd6o3wV7MIulFUZ2P6vYS
	DEaZQ+eR6UD62Bf+FedlKrPLc9cDavwtaja2anbOuru1Umi1llkA0ux/hhwFLj1r9Z7tpKe64yi
	151Fjx441Whl4DweCIWFqJYGbCjElHdTNGOyYAgIvrJE8Hs89hBpAElQt88CPgpFVM90johRgFE
	diqFz0yKVTSjT0SLqhP8exOqBy4ikI/NKrOVl0woG7yF7hcA==
X-Gm-Gg: AZuq6aI692cDUrFHtoWY9l+af0dWTpHMW9qvAPrpfFLn/bJi3ZNUdDHAiSs528sXRKk
	G/s3IuI4oOQLCNZU7hsecISDOaKq4zpr9PJ3NX6avvxDgKEUvMQD3l6jeaRvkobh8Q4gJC5yXJT
	9/OfhGETELo8sWW+UsdNOlzWiPZTtolBk84Rqv1GO5l8ijxltd9OtM8yO57mHD4SPsc5JgLmmgs
	R3+Wlow65HBrmQQHof894Cs7Q==
X-Received: by 2002:a05:690e:d07:b0:649:3d9:d0f5 with SMTP id 956f58d0204a3-6498fc79d90mr2026144d50.92.1769548719535;
        Tue, 27 Jan 2026 13:18:39 -0800 (PST)
X-Received: by 2002:a05:690e:d07:b0:649:3d9:d0f5 with SMTP id
 956f58d0204a3-6498fc79d90mr2026125d50.92.1769548719060; Tue, 27 Jan 2026
 13:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org> <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
In-Reply-To: <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 22:18:27 +0100
X-Gm-Features: AZwV_QgipHYTXMdZDzf8zcCrM_91sUwMX26tgMa5qYmuNwifu3ZD2q-T70g1AeE
Message-ID: <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 9_4Q0PmfB-Ss_2HvecjHzRegLYSFwBAJ
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=69792bb0 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=SbBu0mo9G-6qvOvpHooA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: 9_4Q0PmfB-Ss_2HvecjHzRegLYSFwBAJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE3NCBTYWx0ZWRfXwRQfVlT36ShK
 hOjcY0zkjPmotfZXHWSFv+5SKfX9cJ/U1XgSyYaTLS5oTYSidkGspIpA/6nX7G/cbr1uWdFHDj+
 mAxbuufgM5uDCO5yVkMsaWxIsrV3yAMJvmb47272hiB2gI26Tv8ZezH24j2dEePc2U8aBuny9gp
 63jgXyinl/F9OgrDyOQVKauwo3WTBP8s2YAy/+mrmpdln9fhSTvp/0NPqJRYmQu3YcPjqZAZyKz
 7IYqD6s8DfbrcIWPPpGvMWz5wbUSgQQDjzXz2+4fp0YS40dD8g2f4hu6O3i6gt6LiIAq708Q7VJ
 I/60ywSW6KYgYqNLhFg1DaGrNkwow8XK/cMPfH6r31DerPCEvXVyp7aYuX7bamP1T2T+Lmz+Pzm
 WBnOpWtGdaIm4LjyliOWuVYmJhnQhRwmH8k506LkKpJ/D3ON7q8+6pSVtXBo3SoiKTZOdSxV20O
 9knNxNWYXgl/Kpi8pDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270174

On Mon, Jan 26, 2026 at 2:50=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Sun, Jan 25, 2026 at 01:47:14PM +0100, Greg Kroah-Hartman wrote:
> > On Sat, Jan 24, 2026 at 08:08:28PM +0100, Danilo Krummrich wrote:
> > > On Sat Jan 24, 2026 at 6:05 PM CET, Johan Hovold wrote:
> > > > this does not look like the right interface for the chardev unplug =
issue.
> > >
> > > I think it depends, we should do everything to prevent having the iss=
ue in the
> > > first place, e.g. ensure that we synchronize the unplug properly on d=
evice
> > > driver unbind.
> > >
> > > Sometimes, however, this isn't possible; this is where a revocable me=
chanism can
> > > come in handy to prevent UAF of device resources -- DRM is a good exa=
mple for
> > > this.
> >
> > This is not "possible" for almost all real devices so we need something
> > like this for almost all classes of devices, DRM just shows the extreme=
s
> > involved, v4l2 is also another good example.
>
> It's certainly possible to handle the chardev unplug issue without
> revocable as several subsystems already do. All you need is a refcount,
> a lock and a flag.
>
> It may be possible to provide a generic solutions at the chardev level
> or some kind of helper implementation (similar to revocable) for
> subsystems to use directly.
>

This echoes the heated exchange I recently had with Johan elsewhere so
I would like to chime in and use the wider forum of driver core
maintainers to settle an important question. It seems there are two
camps in this discussion: one whose perception of the problem is
limited to character devices being referenced from user-space at the
time of the driver unbind (favoring fixing the issues at the vfs
level) and another extending the problem to any driver unbinding where
we cannot ensure a proper ordering of the teardown (for whatever
reason: fw_devlink=3Doff, helper auxiliary devices acting as
intermediates, or even user-space unbinding a driver manually with
bus-level sysfs attributes) leaving consumers of resources exposed by
providers that are gone with dangling references (focusing the
solutions on the subsystem level).

The question is: should we work towards making the kernel gracefully
handle any such situation or is it acceptable that if we do
"non-standard" things, we can trigger invalid memory accesses from
user-space. I'm asking this because I've been sending patches to
several subsystems addressing life-time issues at the subsystem level
with SRCU and I've faced resistance from Johan at least twice - not
based on the implementation details but on the philosophy itself of
synchronizing all accesses from consumers to providers (SRCU,
revocable or otherwise).

I myself am in the latter camp. My thinking is: if we expose an
interface, it should work correctly. In particular: it should not
allow the user (even root!) to crash the kernel. In addition: there
seems to be an agreement that rust in linux is good because of its
memory safety features. The issues we're discussing would have never
happened, had the code been written in rust so we should not just
accept them as normal in C or tell the user to "just not do it".

Bartosz
