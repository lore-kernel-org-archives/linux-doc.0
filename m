Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242353;
	b=QX52o98mALKjOTxFXW3dzsfJZrGeY7Wz6L5gF3dfkjLUJLEr1S1MHyo1IAJYLWR4SGdM
	 8pxLh3UfvAUf0RX8KQKXQYv2rFVBeXtGd0kQN52FQG/xaw8Q4zNdr5Z2IjMqun7T2wA77
	 m84y9CY9TdppKPJQQScqGA9JTQmIYyhWoNmYGvCLP+YkH4Ks2DMNjW7fQp/gUgDXcNsRh
	 VcoH/KeizFOF/Fcnq5PZMTihxzDaX+x/LI+iOhKL1y15xwtjL7knhua2B5Ispw4OQWQ3R
	 GH5ZT9FAIAyFody5AhO0nps/sEV5ZoEayikkjH3aJInRvX3vNUVL4pf3Oh9ePrDxhZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
	b=zEF9xZ1uxQTV8PX7aZT1276VGTKZ45SdIyWEC4bkkGczacwePz7W17Od6GBdR3sJBqIG
	 Rv1Yd/lwl8PoZ6rgd1lH4dLhnEiGyEyu2/lYTOV/sLRNTk1BKgGLJwmwYZuvcjjjfvOdn
	 Q0c0c6L4U+r4P+Jo3xf6dp80iy42vzcu59z5mc03qdwyDJu6CKqmA7qb3lMN6MfZQT8w4
	 iOdlEz9Dp8DI9hPRTaiG/eX/TcN/oAZLKN3p8He5D9fyVdmyV/FOVMxkRaO1amo+1y2E/
	 bRnN/P0w8G7TA8fQ6ScblIHNXgsluRm3f2eVh3/k8BmegMDIPv7uJe9djMzr13qPiXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9ccdv3k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B77606A31C
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 16:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9ccdv3k
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-54492d8a988so268801cf.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 08:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794242352; cv=none;
        d=google.com; s=arc-20260327;
        b=Hu7U24lrgWbN+8QnJvUSP2Q2Vt/4/jNjBQJkPTJyDGgLq9vNv2VPZQjBsjBnsLXe98
         5Z35Y822XyBFwca+o4lZp1ZK1IFG43MAqQAHRbbcWDIGvUR7ORfpKhEabBYON5qr3/j+
         QNnBNZcaEebqUub7/2y4hBLs+qayc17JkwLWbINWsX5CATTs/wluSPcHhWjlXHFfpOqy
         /ak85pH/UTxb8dWO/2vYYwac01jCj48l4odNkKaGY7HG3cmQS09c/BO6xON2p11D0Mc7
         v7Cygo5SNvEPEg4hDyVJ0jLp/BuXDEPnYq8H+U+RPGmFUdDMBltoWdL+Se1jF19jY+Jh
         3xoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        fh=rra9tZ+YF1Zn6HEm2BD/vfvU9wDXlsDqEv2zENooPDs=;
        b=YAX0lI6FzAnoaRpzoT/FIChqLut8JfOBu8XxLnbk5xTt74/YRJlRFioOnfV/OG2T3w
         Y0nw4ZoQ6Wa/Ed3qvJERKyIBliUUU/UwM6gV+cVCheha0gDFB3KH2ueWCMXtt1m6Msoy
         NsXPVgc9nXOWWqqe57K++h9mklIO+8ez4JIXf3ofzLSXiuz0DrAXJit05WjUzBeTp3Vu
         KPPBLnWfLY6PBWhMr3g2vKqEV9nhtLRcVRl0bVaT+t/ugGvie6WT6ImC6z3AdqUr7tHo
         pkeWHGeG6q7XYauvEYlq2xLvrVBJjfbbSDCLg5WCEZX1Ih+tA4/0S1M8y53wqj/X7DSo
         Ld6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794242352; x=1794847152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        b=V9ccdv3kK/Lbx1Ki9SfCLupe5m4AB1kXkJnwHDXcTbTB5eivVr+DgayWNH46vmTbE3
         LAgIu6SrTtf0DK7WuYphsLXwxG8xDvpU0IdExkaAamByNth8mgXQjBnM00XZ0Dqh0YwJ
         nZtHi5UCl5R7zeQ8Igx4eFdV2oDs79h5bGJ5jtWwHM/Cn5uHcM348DGk3jx4pThKU2aU
         34NqNj7plitjbus8/7MEN87B4ZriRW6jvASOnR0aHKjYhUU5xT5XvubDw4KSVDMSRoMm
         c0bFTl06PloYMgngbUCB1SkXbW+lMUA+0O1Py2U5aEDtJ91AdWbnINpbE32ryrhk5GOo
         fbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242352; x=1794847152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        b=fn6EfxSa2vH2P6xn8ABUjJZj6+65L0y4Z+1QeGVoP19fD9v7toXsYbHHkI4+AhWN36
         Ne8cJBVvGHQP+EqgA3VTUFImugu0luj3KrSZRH78+iItdGUZVQGV7WFutowf3fLKbdjM
         QSS8WbbEHp5WBsf2tRpOXS57Yd1jDRMUYPiP/wIc1VmbODIhDURPg7GStI9AbM9azrzO
         YpdrU8vukhjAgXzfLII7gldIhh6MC9gELGbOYitzI3mlfkPgxIV+JgP4e+H2aGYU33RE
         OHga/KzzThnPB3qwmuBHH+fDXfd4k+xMZlHBzRBcUGT9ZYJdi9AHH2B/YCSmQ8r0WJB5
         t5Qg==
X-Forwarded-Encrypted: i=1; AL+hErEWufE9PJz3PcY9Kfnl8fwF/WOfIrTBM+E7+qfYoEYUpEbE5euZecNyPDOYO3g/SQm5KmNgpEDvtAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZSuG5BCgb5frJI9TySw23/Xr2NvTeaBCluwOO+YKBfnlI99yl
	OieUd6X8edfOnoyWZVb00CGib8g5gnUw+sNb2gzHAIY2cyteWAJ/zLWI5oGoxgTmsvMrhfU2lnK
	KuXFkZeTQmMY7AUGkMcV/OoPmw2AsFJ66qzsLJsEw
X-Gm-Gg: AYBFou0/kM5NeZOhUBy6wttJdICrzIoFw0SSqKbtTkSYUh6SnYElqDTxhOwNCa3MDxf
	mWlcmZm50Ko2OAAnDSURG3vXcGSS6hkIKzL88qa1FGz66BsENDLhfVbg8xTEpTgdjL6zJC8kfdx
	pz7okwM1Us2Qv69qmIspbCE/fH+o6BHGVAh5bWgkanhr52eAhNeHQ1+K+bMAZELA2iLJ9U3LE+m
	ZDGwmDgh+49MyZ5NH9hYxXbYN+r2EzqUZ7ouWJG7peJzL3ce+a2tBV9GnS3y1ByShDnptzqr1Qx
	7SlOdImrYS6fScnCw46LwF+U8pBpy1BcIKPKYGXCkuQJRzjj1fHpxPG05y9av8gogsKk/06yKqW
	HAnc9Pxri++pvF69/rRg5Y9PFSoZV0O8nT2hSyA04K0v9v/ZWpwVU1pTCfdYRwhiOTIk=
X-Received: by 2002:a05:622a:2b4b:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-55519d553afmr66891cf.10.1794242351337; Mon, 09 Nov 2026
 08:39:11 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109080126.417161-1-irogers@google.com> <20261109080126.417161-2-irogers@google.com>
 <179423587020.3133545.6594248101575070050.robh@kernel.org>
In-Reply-To: <179423587020.3133545.6594248101575070050.robh@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 08:38:59 -0800
X-Gm-Features: AclHuK8feNx1zDrXSRA0wP-1jAG_C3k6aMQ0LXM4MGvjXYCUb91zzoIWLHYo0TA
Message-ID: <CAP-5=fVDVds_q7NjAcapJw4pUx2psF2c9AsaKZC7nJbcOHOJ-A@mail.gmail.com>
Subject: Re: [PATCH v19 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI
 PMU definition
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Rutland <mark.rutland@arm.com>, 
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:51=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Mon, 09 Nov 2026 00:01:24 -0800, Ian Rogers wrote:
> > Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
> > found on BCM2835, BCM2711, and BCM2712 SoCs.
> >
> > The hardware exposes two MMIO register blocks: the primary monitor
> > evaluates the System fabric and the secondary monitor evaluates the
> > VideoCore VPU fabric.
> >
> > Co-developed-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 +++
> >  2 files changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835=
-axiperf.yaml
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks Rob, and I appreciate the testing.

Ian
