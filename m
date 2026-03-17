Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4B3BD25C
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 12:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749671; cv=none; b=uAmU0FoN92dnNY4qli9dVZYHJfuU7tKw9Hz3y6tmY0HLHYjQKv+buAa5o0oO4iniPtys6j44nKUJBFQRXDC/JPNsUy0k+uFTs5u3huMdpQ+tOmxB85l3h/NFM1QHu5k0Gd5bkxtu7z1Ung+wT5A2KjF4VOmiMfZrjuqgmXDQmy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749671; c=relaxed/simple;
	bh=Ueg1p2m/pOiM7sMP+EYdJR1vZIvtjQRbK1MHKIkw2HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cq+pwO5qwmTQx/4bn/Nnxw+d+FWdd+FXqJk951wPCl3F3sHN2FGVxf5YLVr5WYBa+7xqapG7WKmB9FzYrAKYRkHOjXvO0Q11cPcZDktlqPnx2l4FbNWsg2nwlMOkjpS3ZtddAHR6ggBiFQdgpeZOqhZGjbyqevbnpUvqGKpah6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfRDZYdA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxMwE9LJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfRDZYdA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxMwE9LJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7h3Nn1639617
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 12:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SxOfG7tOStpWqKuxmoaUoCgA
	Yix9uuGWUOMA+Wd1nZs=; b=QfRDZYdADhLeV2ZqDrhwmzileV/4QXXdig47p9jq
	rJV/cjZ7952RIf4QI14OmELhD4tuvJ1UWlMhsOYMJ3LO0ZmyezXrE3dJeBBtraSt
	eqxKIwH+Yyjwt2QGYSfRCX8xPsIXzu0aK7qQicjTsIlfvXKi20TDB+phLs3RktP+
	k0mFoAN0VisTZWLqeviSXhaVbplzKHrvWf+c4ZHb/LEWANUBNryqSNx937Mp/UIs
	ChxqqxxqvxyKGMu2df9/6fxFlUPPEnuu7j4vC/oTZ23N+lgIZ+1A3/oFSyM03YSq
	nNR473xiTbYFHIW6mYDBQXdfeSRVj8quFMPtplbVY3PVrQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0c5fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 12:14:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8b37d4b2so767580985a.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 05:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773749669; x=1774354469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SxOfG7tOStpWqKuxmoaUoCgAYix9uuGWUOMA+Wd1nZs=;
        b=FxMwE9LJNoDJ67COw66tEZ9odgFnjfqggM0yUOSXVV/dcIxg60qussoZRZJ0IAzO/e
         3gaHBT0u2dj/PvaUCWC/e1cKFsVf9G3FvA8bQu0nGcpb1A2DNLkNGsoZc805jTNeuBLW
         pFeJmx5PwwRc3aDmtNio0ILNTigzTuUZbwUToRTxsUm29jIaIAfZPacVrJBkSlLRw16e
         55K9n27zVEv44Ewv2a6IHS+MtP+fLp9ojwaANZZKLK9jJ/IYe0NDTRBQCnK/faP4+n3w
         iyoQdNZp2ZvxcPtPSOKIIvNcQMcxUOR9z+KKFeBlbj808WyelS7HNA0mqqYHZsz+4zXB
         T0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749669; x=1774354469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxOfG7tOStpWqKuxmoaUoCgAYix9uuGWUOMA+Wd1nZs=;
        b=XeoRF2pjUeBjYaen2R4xHrw+xxSauIPO1nnbXgxgg1+ZS6Ke4KtlBQO1cWbqjI71e1
         e34gTTfMALFJL2KAXbbCpyle9EIJzoMwIQS4ayzp/1Q5cxs0+oIFACpP01fXNbGTmgMd
         aoL6cHIAz12BNG2Ll8aNnWm9WRrm+oA5ajNNX0QTzyr3+4MH356mSb2LyPR1hy1akZc2
         VOJ8zj4VDTgSS76Tpa99x4cCiAeesV5gJ7IMperIh6na+vHSIx1UlBDpYWjHLv02Ihdk
         8/PeCSFhIe8VXaotd8QF7mLE1WhMk57gfEYnkw3Q3LVL4QeXNjGbFccmTMe6ype4S3xL
         IIRw==
X-Forwarded-Encrypted: i=1; AJvYcCUp02m5cpkKvKyz6fJv21CEsQdPsSp7FEC+7ykACbycI3DebV+UWOA3PhL2m9U0w4C3uKtOqYLpya0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRS5/8+bHQeG1S9wkuGb68pAYLnn80lanl7XmXx933+8gVnBQY
	tw2iUzQY05RV2fIRkLskJvkFp7e7JrpN1es23TUWwErwIGxYZHoNrvCgklI0JKe1qm+PRTuSRXt
	OKkM5LjqKCQKYHF0bgH9dnmhqO1oF1ZgOnnU7j5FP8/fMGu1NF2YbsN1lx7CwIWQ=
X-Gm-Gg: ATEYQzyI/0BUXTQ3SghZQnIiLUypwx1wyeBmDB0xRfwWLD4ZFQpKWPYQlS+HVCi6y8P
	IKN/caqotHHd89pQC2F3jBZLxwawD6uOFbgNFC8CeMuVCyAWrqqUHIBbcnNkVqy/tUBvI3lGkY/
	1W3l8nDEFsvQJPdfiWjJ74J09DMhnUGBi5M13wI6loRGQ2OjOBa2Fr6FyoIgdvnR1pagLFfjrsQ
	KZumryJpOpyNdcpeFFpXppfQX6o5gSdIq+p7S95UvjA4XE5QWMHfk2I/FcOG5LMTcmcsN0xU79T
	67WRmu8dDI4bXvTti9EP2kPIh7nn4y3ja3c/MJdlccVAwmU/VWLu60eCBCTnL3ojjQYgZ2epa8w
	hTBbwgxhj1UpxItvOxqJLRR3h9yA/0FZoNA==
X-Received: by 2002:a05:620a:44c7:b0:8ca:3c67:8920 with SMTP id af79cd13be357-8cdb5b70212mr2195506185a.69.1773749668444;
        Tue, 17 Mar 2026 05:14:28 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:8ca:3c67:8920 with SMTP id af79cd13be357-8cdb5b70212mr2195501285a.69.1773749667878;
        Tue, 17 Mar 2026 05:14:27 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3b0e9b99sm27806074f8f.18.2026.03.17.05.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:14:26 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:14:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-almond-leech-of-correction-2a2ef6@houat>
X-Proofpoint-ORIG-GUID: lrVCaycpFoRGd7ShT5IsbyHMmEmucDls
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b945a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=vTr9H3xdAAAA:8 a=JBf41zNlYwkEi2lwROAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOCBTYWx0ZWRfXxvzZxf5QKeqv
 45we9XhR7BS9Kw+wA6YKW5/Pe6//aF0dGJmNaly2PHNZdF61qSkkBJ8MUX/UzM4LD7nBfchcFKK
 K5Zg0tqa4RkV1PlyZjaEECMGLTAybNBfKqmWh7gInRkPjF/H2VWPgWa8urBGo/k8/IaS/4QbGf3
 Yni0BbPjrGipZHp5zMCFdM63rirVIw7GNvNqq3/KqyD3OH5vuXS0ioZPWA+/yC0PA1lzZsoor/T
 FN3F3q6z8hsPQN6JS+k2+VH+H5GM2j0F3Nm6T/Zq35aKJToiCBGjRvSoTYOTRizfEJHTAUDDymL
 5q97METQAq9llCa/3u2pDiibuRU8vXnOSRfB/cl4lTaJtqG7fBkl4kzcHvO1WqyFG7omFD3xukZ
 HUA6h3x6ibIM44ticJBfK3BtzNA2GpF31Jiarz51GEwhMUTvDpmvqm+sKGBA7IVMhlXVgLxiE8L
 uuzoZ1VXg3/6r5Lyw1w==
X-Proofpoint-GUID: lrVCaycpFoRGd7ShT5IsbyHMmEmucDls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170108

On 26-03-17 08:30:24, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > discussion about how large number of systems need to boot with
> > clk_ignore_unused. Per the discussions at the conference, the existing
> > behavior in the clk core is broken, and there is a desire to completely
> > remove this functionality.
> 
> Broken how?
> 
> clk_ignore_unused is to a point where it's seriously cargo-culted and
> documented as a silver bullet, when in reality it's just a debug tool
> for broken drivers, and the driver must be fixed.
> 
> But nobody is actually fixing it.
> 
> See
> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> fedora wouldn't have to package anything, change anything, etc. But no,
> the problem is clk_ignore_unused.

Nope. Don't ever mark clocks as critical unless system crashes without
them.

Here is an example or why clocks cannot be marked as critical but need
to be kept by the clk_ignore_unused: display driver probes later.
If you mark it as critical you just made the clock stay enabled even
when display is off.

And this is just one example.
