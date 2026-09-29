Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D39527595
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687932; cv=pass; b=Qytk2zFNMDhXAa/PCYGlM2QBsNe9tHlcTiWZmLTGjBB86z+NVBjxBkXSMwRcURvgtGnRre3/uiZMIcx9ynHW7ApAe3FGwZ0JyrfrtVpqOovgf+CrGQi5m/gLY4Kxb8RBW480yObRf0aaGyE4T27yJBFTUNRm9LoXB/8JcsojB34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687932; c=relaxed/simple;
	bh=dnRZgOZPN8h1C48So+KfFB399+wu5SK9LTEtwCEcT2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGrUttlcNf9P3sLvEdcYtYZ7nCgwQlkDjDZzDifLQnojSte8WpyuXVAv8gyzKRRudjaFXs6ASc3DivuBUzFBN/xYvRiumUDO+yaOc0tjffIRtHWSRQ3Rvn8ybSx6QRbcbEHkm4/kTyNSpix3NnsRF+gdmcWrCgfcoi/qmU/m8jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcZF7L3O; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcZF7L3O"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba2e61f172so105067e87.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 06:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790687929; cv=none;
        d=google.com; s=arc-20260327;
        b=gzJLshTyjPCLrCZeTiDox7taTDyu3CDtooGcULUg0hh2apmpezoN49IK1YykFsVT4C
         1H+Fox5EEUcI7VXogdtZe13VN9xKaz1ayoKAzF1rWbzzjoXdk6krgcfLdSphVZXPGmK1
         /SEKdvi9gXGu1nS1S7DO8NphoByE/Bwqrhj6mRM5hgQfYhuBvdqcurCy8bwK+XI586zK
         HtlKvWZN9by6dihkT7QnW/kzKUVlwUMS3YIKErl2DjZiWsdvXa5dJrrLHUxNXMwOWtnc
         CqXC66Bpgq+aQJwuypWQPHYIfYwOIyAtVR9v/Kinh0dvw+X2uPh6szDz7THXKGzyzOP8
         cteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gRqL4mq8l9b/8+1doI0jfOmB5WaZxv0ewJ/nUke/hgQ=;
        fh=12ZTGwBjNy3cvX2nOD0b86hiw41QMC2zOthEksz/5Fo=;
        b=Tvr0f7C7vT4/LJowTiBnk2SwfEQhXXp2BGxpJo5dxrm/o5JFtPzaZ1Exa1xE2jTT3b
         sbPWxY5unguRrQAn4kJSm+TudMzmTCddIT4L70rvLiIH2dq8fzeUZP8L7O1+S+s0h9pr
         Iilb9//IxC2u97+GHh0cRuSa7CYZ+DTR0dumt5gICuFxDUXc/zQB5s+xIUtCPBvJkP+a
         6/faKrsBHCBnaX8Ws/NEJ2FBMUNfpz9XOccGYdiqt0UuddTsosm95hvdfJRJZIT2P3R9
         814OUi+uAeqFuRxN1JappPMWO7ro3vYSEoVPXkNDwmqyrwE9ETP+UsBswn3sZNGrxztX
         zDFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687929; x=1791292729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gRqL4mq8l9b/8+1doI0jfOmB5WaZxv0ewJ/nUke/hgQ=;
        b=qcZF7L3OnrfiKm8Z+a+sMqBBK/erb1XVb+acvu7SHvhz4HD4v/VgDy9RWTE/Tc2iQ/
         m3L28MVnczYZ9jBAYJyzw0XFgN2UieVZF57ZaZ8iwu3I4vTmU9UHQIJe6NlfVO2dKdBk
         mjKUUAEhSgNnqzaBueuxHASqHxqJVmLw6zRmatTf6rzmJPNbvWIlpQADLkeEXLxV4B0H
         wGqc09VYdp+Z77+fXbwMopLYyJ0mukcoyNp47B9LJkXmdYlb7Q6eMOiU8mRPNbIUaA8G
         yEtUqvRCV5PH8uSlXNu85tAcgy+iz/efYcSKXjrJtpw9JVm0QiqPqkmvYbaaGxrU2N/w
         s/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687929; x=1791292729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRqL4mq8l9b/8+1doI0jfOmB5WaZxv0ewJ/nUke/hgQ=;
        b=rS9KwpKKEua+wqVl5wLGMqvCCJgQgJ4AHtmnWq0NOLi2Rw771BcLO9Nw0JeAzXbLGt
         xRz9PgKWKnz+fPEyCd6RjgTR1fd7Futa4SAJCqT6CuiJl0HKDSHxFDf77t2zpyPnwR1r
         Q+o4Z+H+iq2cmmYh6Bso9Ek7LN/iLma1g0v5bWtZ/XGYuYBoRvb4ZmVD1wJ+FQlEIbqV
         tuuuIR/h3JuK7Fc/KUWAwaL6SSFp4soNmwzaEpauaan0b0CHR3GtUTJcsOIFePPzv6An
         dZS/KlKKyYdkB2VPRc70L2+FW6E5JdtlZ2aGajjt1JA/zUL4jD9jdcXFfCGv8mmKtRVi
         DJzA==
X-Forwarded-Encrypted: i=1; AKwUvByQOTLohU+vnsJzwyC5Z8Ar3O364+8XDCLl3pDG/6pJNziVIJIx2T9dQljQBCQGgV0KCJDyihQlIKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1iHVQ4L7ISESOw6CQE/T+ffgBJrCNG3QVjBNwGtenp9/oR3Kn
	Xil/nQPtBE3In3kmkSGR9AoIORW06Mtj3U3EiKHH0YqCobbBOmKs8p2aKJwHTXB6ZgJWKRb7xd7
	9P3ekRZxGqsMRHWzQRbAGiLd/dc5uRLw=
X-Gm-Gg: AYBFou3ZDr9aTkUlnFk+NrnBExf7Bg8VDhYrGG+QUj5dXpzGmN+Vr3wEAYdwoBytkAG
	WmH00MN2hOtRaAlBmfSdz1HzIVN/5I1097r1gatJfvr/N+Ml/V3zzGMdUDUv5meV4tFkiTZ8Fp8
	871KdCgdqprip4oJ7RuS8CoJ4fyYC6BDiE66c6vCJub8sD7zkj+zwDI0k/C26hEiX4BELZmjWVB
	WOijoOt53072LZNaPp8W23Y7XV8KOfu1CDGfi1xEqKdxy5oQDjYtTI9oLSo87jp/FLI6fStC2Y7
	UikMGh8kAeaRD7wMasRmm1SrI34wkngn/5xaxtkYVo1HgZKJkY4Kw09/ti5bPmlQ/esoT5dghMh
	FatDJ3azyDgpcVt1/VcZduuJkUmLztGUfHc8vzAy08m6DSFNY
X-Received: by 2002:a05:6512:4020:b0:5b8:f0a4:350b with SMTP id
 2adb3069b0e04-5b8f0a436bdmr3345652e87.1.1790687928678; Tue, 29 Sep 2026
 06:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929115956.229610-1-chenyou910331@gmail.com> <CAOB9oOY2V68_qnv6DFyDJL2d=50zN_oQ6=6+Fs7=Ez+9TnuDmg@mail.gmail.com>
In-Reply-To: <CAOB9oOY2V68_qnv6DFyDJL2d=50zN_oQ6=6+Fs7=Ez+9TnuDmg@mail.gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Tue, 29 Sep 2026 21:18:36 +0800
X-Gm-Features: AclHuK8JI9A3jbYNFYQfj8FyUPccoS-iBb3m2QeZc47P98WPh-RJeMF-A3fYA6A
Message-ID: <CAKspUh+rJ7qm7VKXTYcqqPxwNWnNJ09p3DAciwGXGzpBCOJ=NA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
To: Yizhou Tang <tangyeechou@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, wy@wyuan.org, 
	si.yanteng@linux.dev, srcres258@furdevs.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Deng <theandy.deng@gmail.com>, 
	Bailu Lin <bailu.lin@vivo.com>, Bernard Zhao <bernard@vivo.com>, Bryan Wu <bryan.wu@analog.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chucheng Luo <luochucheng@vivo.com>, 
	Dave Martin <Dave.Martin@arm.com>, Dave Young <hidave.darkstar@gmail.com>, 
	Dongsheng Song <dongshneg.song@gmail.com>, "Eric W . Biederman" <ebiederm@xmission.com>, 
	Eugene Teo <eugeneteo@kernel.sg>, Fu Wei <tekkamanninja@gmail.com>, Fu Wei <wefu@redhat.com>, 
	gao chao <gaochao49@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hailong Liu <liu.hailong6@zte.com.cn>, Harry Wei <harryxiyou@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Junhua Huang <huang.junhua@zte.com.cn>, Kangkai Yin <e12051@motorola.com>, 
	Leigang Zang <zangleigang@hisilicon.com>, Li Yang <leoyang.li@nxp.com>, 
	Li Zefan <lizf@cn.fujitsu.com>, Maggie Chen <chenqi@beyondsoft.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Punit Agrawal <punitagrawal@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	TripleX Chung <xxx.phy@gmail.com>, Wang Chen <wangchen@cn.fujitsu.com>, 
	Wang Cong <xiyou.wangcong@gmail.com>, Wang Wenhu <wenhu.wang@vivo.com>, 
	Wan Jiabing <wanjiabing@vivo.com>, wheelz <kernel.zeng@gmail.com>, 
	Will Deacon <will@kernel.org>, Wu XiangCheng <bobwxc@email.cn>, 
	Xiaochen Wang <wangxiaochen0@gmail.com>, Xudong Guan <xudong.guan@gmail.com>, 
	xu xin <xu.xin16@zte.com.cn>, yaxinsn <yaxinsn@163.com>, Yinglin Luan <synmyth@gmail.com>, 
	Zhang Le <r0bertz@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 8:14 PM Yi Tang <tangyeechou@gmail.com> wrote:
> I have no objection to removing the duplicate contact information. I
> noticed that some translations in these commits were changed to
> traditional Chinese terminology, such as changing "=E7=A1=AC=E4=BB=B6" to=
 "=E7=A1=AC=E9=AB=94". I
> suggest submitting these changes as separate commits to make them
> easier for everyone to review.

Thanks for looking, Yi.

That change is not part of this series.  What you saw is in the
range-diff, which compares the v1 and v2 patches as text, context lines
included.  v1 was based on v7.2 and v2 on docs-next, where the zh_TW
process/ series has already landed; that series did the terminology
update in separate commits, e.g. 5f0178db86a3 ("docs/zh_TW: process:
localize terminology in embargoed-hardware-issues.rst").

So "=E7=A1=AC=E4=BB=B6" -> "=E7=A1=AC=E9=AB=94" only shows up as a changed =
context line (note the
blank second column).  The v2 patches themselves change no wording;
they only delete the credit and contact lines.

Thanks,
Chen-Yu
