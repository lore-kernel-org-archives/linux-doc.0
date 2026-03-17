Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3BC31F999
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757213; cv=none; b=clmtQJx/eFUxpwU8I5k4UAobcae1j+pA3zcP6T1eOqCUzeAz34OOLUWn5LW/VDg78yipV15Q6Bq/sW1o0P7AoGB3oWlnolyXK8Hn8nDRj/iYCUrn8rTif7TAbeF+/tPgLib8CaDivaZC74mjyR/SVN+/yZdqpkCIR6/PT1P6qTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757213; c=relaxed/simple;
	bh=h8RokuzQTmpUInbjp48eFI4p729TuWFXN5xxFkUYsyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFCxSdNwFn/xtGWB6GeTC5m4yDywle0SxDIgdOzj5VS/s/lXADUgfbQPWptXDO1lD2osmelaMCkBX5XID6NMgF/KEy3JJtxGvoB3/TsGtrvWbKzt9rZbglw3Mc/luBfj86JSWtlYz2EH3iUIc6U9mPUNg0TcsBUfPgV/jjZ5fsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2J5+eJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+eMRKHL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2J5+eJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+eMRKHL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HA39TO2071568
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UMe5FwLKUI79zakUaymujYWJ
	qo56zT7hQ3zo7cK1/jw=; b=U2J5+eJVv03wRwdAgX8CYwqHMCjvlRVyXm+tONJ8
	qSmWZg87oXdUgTqK8FGYeKra5INhtX+FUutx/P/t19mrxCaco5s/+stUD25Jg4yM
	rySEVVjS+O0ZHnBYerZG90DcnQBckL16uX+iYXy8C7WEJ8nISrJOebH39cY39MUZ
	GP2gJNMzY8HZVrt3ot+d38VDKG17LW4OGgRPAVZaYBy24ya2JDRU3eQUcW1FrYGw
	k7rNvh6SvlZqUpHMPV8muJaFzUBAh7bWv0nMv0meY/Pkc+PYok06aTlLHvyYiNpy
	cD/kFyIJIsptDeHoLW8ehePD38WyQYta5yBz8KBw+uvMcg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6rv1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:20:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso7470386137.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773757210; x=1774362010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMe5FwLKUI79zakUaymujYWJqo56zT7hQ3zo7cK1/jw=;
        b=D+eMRKHLRYTNElgDFTd6FAHYdVYohW1t8FcWDri7kE+K1/9VtHOECw1AFihWIzPlWT
         1VqcRoEy4xzVB+erZzed3o4oKZmX8ntEIyexn/68GB8orrxxz0f+7GVMF5GZUh4Vm0tz
         Cx6ZsQFrGPDAQPwOBZvyKY4FGD5r7QaMj3YikbnYBgk32uPGXEIuDZWkz2TLxjtE2wjt
         e21gHZzcyKTR33dQFJndNR/W8PBz5oJKznYCz6USvLZ3sSnSGRzWDxLLaX1FLuURpSH2
         uy5UZTNhDy5RdWSDE2Jj/wK7KeV8jRmjnjwdL9ITPMK/QM5bDbl6CmOr85anTILVj2Wi
         JjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757210; x=1774362010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMe5FwLKUI79zakUaymujYWJqo56zT7hQ3zo7cK1/jw=;
        b=iT9s5ikGs2HG7m91zJAdH8wQ5UtBYOEO4F/AhQgczcn92p/LAgOEGdPKCe/yXH9G/I
         kPrRdR+nlVxOuqiL0sVzqYCg2Ivma4mB8GkETXqnRdCvyaqAAeBvYktLx2Xho2btHARq
         WCYKC91wZDt6VtSqZ1autH31sI8ufcMjEdqU/zYOk8oirmp6UYYp9I1aurb75d7c9//U
         bdA0hYNqMdzyGivzLlLla2Q/UdjgywGL65mp0DZisn9SUTs9QuF42BCCB1PfkEzmyR1G
         wggn1v5WhS4OGleF88vpatg685/vnyBUKpd4R/vgQbqNQV3NbqnMTQm9X1AmzAo/rqlT
         +Ykw==
X-Forwarded-Encrypted: i=1; AJvYcCV3xhyzzaMG3WA5y+s8fNXgMhj61t2JRnbg/IBHqRKP89eQDzRquU9JDrX9gZ0SeuI3UcTlhiDb5q0=@vger.kernel.org
X-Gm-Message-State: AOJu0YytVtTbEp4dvlSz376HkPsYjHFiAHHqFGBEiNFln9wHp8+FBM11
	wgTqxllFmhCyLFAo4duHe/zhwd6oWuDgJiYnge8yrJJcKDDzZvXTb6zgit/ZrI96YfAxr7hIxNq
	nFGAWezHmE6xLGpU4ME/W+XWQPGs4tw1zG2nMfxOZI5JZi88oKEg+spbJDm4nAjA=
X-Gm-Gg: ATEYQzy9xUajpFT25VHRONpJdL6BZRUc94TcUPjKl7TqJ0G0qomcsMg8sIJvOpB3Bu6
	7QkjIhaZoyM/VhzycYVvcTdj1Lab/yTOn1CzWmNrzrUjzxjmfVjJqKbR7Xdarhq19VVfdonZ1Be
	oE0Rpf8gWElfqOlA25dPbcS6cnmLkn8jqFhbIEZX4mA6XPGvD9wJ+XekgjTwYhu4yWhQk9OfgKX
	uOmF37Ejb937HvV25pf5Y9wA13U99Oz/mcEUdxaFjNUJCqBdoqCkAOn0nYe1iQRi4+El02zh0cg
	f3tAtrSSMJYeytRCbuBZxY5c+R+titgKzKXxOyYtQUy68ZywBkzJiS+61mqoURqYe2gb0p8koUr
	ipVuY06yCFPuk8CTnjUzzC3Siw0A1t/hjWg==
X-Received: by 2002:a05:6102:32c1:b0:5f5:514f:4e59 with SMTP id ada2fe7eead31-6020e5f6a8cmr5641702137.27.1773757210173;
        Tue, 17 Mar 2026 07:20:10 -0700 (PDT)
X-Received: by 2002:a05:6102:32c1:b0:5f5:514f:4e59 with SMTP id ada2fe7eead31-6020e5f6a8cmr5641681137.27.1773757209549;
        Tue, 17 Mar 2026 07:20:09 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556422338sm122583015e9.7.2026.03.17.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:20:08 -0700 (PDT)
Date: Tue, 17 Mar 2026 16:20:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <hdagvfcxoh4nukz5sqocbp7qbezv3rxct3aygb7fvhsej7zp27@iyeoi74q2w7n>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
 <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
 <ablhdKJgEhU8KmtO@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ablhdKJgEhU8KmtO@redhat.com>
X-Proofpoint-ORIG-GUID: hwDLpue7x-Y2WLFtO-AjLltoSrxG2hJy
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b9631b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=aJ-NGQLJV4KphsafQ0sA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: hwDLpue7x-Y2WLFtO-AjLltoSrxG2hJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNiBTYWx0ZWRfXyuFNwG0HQ+cZ
 64ppekLtSdq6rAPLlyFU2bd/47qR2va60y1C04fCGqMFxsStHyRhLP9F8D1BtwV1hBonBKQyOk5
 Fe8Ml7VL7zgNgzft87cf9yGXmLmcSYBshocbK0E/fwGWre//RFVbi11OFxXWqXJBI0+s72Ps6gp
 YF+mgLNx3xRfXn/NBHaX6onyO4trjMYTiYGsHfYGUCMBt/GlwQaCXEVTo0US76jVVz4n8QujHNP
 BXUC9TuY76rFFUAUpp+0ZnQjL3E/+F74wVyI99FXTL5YpxC0iAznirWtr6I9xtjxy6g6xRuSVN5
 yQEL4sRhDSnsRkpvuXGBub+2fVw46598spvPMRZ6DW4QPJQPDO5dDYbMhf2uIIoR7e3sxg9MIe2
 cThuVZogzIhBctywVbVqIiy6u4Z18Ga+iNdz7rjh4Db06vDGj2xsS9RxZE+oMmBctfLoMDZnRpx
 Yx4XPh3cNp2Y76KHnqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170126

On 26-03-17 10:13:08, Brian Masney wrote:
> On Tue, Mar 17, 2026 at 03:21:17PM +0200, Abel Vesa wrote:
> > The solution has been already discussed for a long time now and it is:
> > drop the clk_ignore_unused late_initcall entirely and then make a
> > generic sync_state callback that the clock providers can use (or they
> > could implement one themselves). This way, until sync_state is reached
> > for a specific clock provider driver, all unused clocks remain as is.
> 
> I'm willing to work on the sync state support once my clk scaling
> series [1] lands upstream. I believe that Saravana posted a series
> related to clk sync state, and I need to look at that.

Yeah, I've spent time on it a couple of years as well, but got side
tracked...

I'd be nice if this actually lands soon.

> 
> FWIW, the only reason I posted this patch is because at the end of
> Stephen's LPC talk I got the impression that this was also an acceptable
> change. I'm fine with dropping this change.

Here is the scenario that proves adding such config isn't the right
solution: think of single kernel image working with different SoCs from
different vendors. This is actually the case where distros need to have
a way to provide one kernel image + thousands of DTBs and be able to
boot one each one of the boards. Whatever this config is set to in the
kernel image, it will not work with all platforms.
