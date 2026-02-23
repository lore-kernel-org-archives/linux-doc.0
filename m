Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0907E378812
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884759; cv=none; b=vDPrQujC+bsH5ulaA9Crbc6v1oMlNhSYJpyzwEpOJZ7nRTrlF0FtwHSeLow2SWAd5NI53nQyZbNtf761Z/t/H8rTrjqwaVN+HRO0c+mXETfzrmkBrx+H+9WPBDQ3oQOOhpqkRScesIFT4hN8W9FjbuBWHPdPEqause2AQutQiNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884759; c=relaxed/simple;
	bh=Xmv6AivAPcyN4oojDSQhWKjUpiZH47TkKPpC0QkmJxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUTKLIU9vvW697/kCF3ZvEKYm13VX7Vb0RvrhGQbQCShe2IggmqeVsQnFnx2B45FbFCEOSj4RnhEiBbGhYoW2t3W4+DeXWJzbvne6GCAoG2jOlaSvEURbDZo1ncxTs8p57g60PkYrfg4RzwHcX3QUiVnAbppHqILL1QznM31lvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l74upXwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXTHiZBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l74upXwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXTHiZBN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGvRxa3478625
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U8+99t2Q08+ketqYxwhfTfYr
	syyINxyz6SnBAR9Q/Mc=; b=l74upXwGKe5nvGSpUt5Sr+jvI1kN0EmQQJwIkT/f
	5rtolmxcSheWmP6r/BFNpA2OevUrbWJ+NAkmQcD4GHilDIXCkTUhHpz27O9z1yFC
	CBVYpIojePUWbaaugRyAZVBDVzIaLJN9nUYCw+bziNJV6OtlW+9iGCmq98a2W/ER
	NeBaHDaTESG+IjXV4SYxQKbS5e25zYOEnyIUu+lFeT7wKvY2JTB4pqTnN1Cb3IaB
	PqrL3bNhhZr7fM8R7W7/fXm16D96rajTYO7RSnV+Yqg/f+pfsHLHRjXOIwXac4Gg
	W9IkXjkizbIiNY7WGpfiVoICtOTDa1h7TAOVvkHQWdq2fQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9rvwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:12:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3a129cd2so5952077085a.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 14:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771884756; x=1772489556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8+99t2Q08+ketqYxwhfTfYrsyyINxyz6SnBAR9Q/Mc=;
        b=cXTHiZBNDQ6gr3OaVBaPjDejL/cjg/L1LLkTZt+Bez1N1l+OujOWuEb7xZPmKD4A1x
         cuQKbmoHkQa3A4jA/4GSMO7T0UGvT446DAC7N35Fwn/ZmxBIbJ0VJ7XjfN43YGvgHqhY
         mZ/SI8iPHPKCy/bkEBi0MZzQPn75FigFgpRYWyE0PNU6GYW7Uy/ULqxA6vb2piXP7Ga4
         4DYjpMEq/0zjWtR/bYlRvoZZOaVA+x+zm4tOMBPfJiCdf53FGf0kYUA9vXaSZPCKtZYB
         LFp2LhQa8sJon0OctXr5mku+rHt1eRp7ioYBo2uxlB7NlcfkdRMVtZ01lhNgr205IeeQ
         A9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884756; x=1772489556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8+99t2Q08+ketqYxwhfTfYrsyyINxyz6SnBAR9Q/Mc=;
        b=pULHZ0VLZDIbzvzor7DOXmMczGmyFxbVVkB26TLTnd2PmZ5BAF29Vc8msjt6tsk0U2
         akxNkTCMLcK6E9+kJGOhbRuMr+uiPlzh1vthabKSKmhaYlhuoAa78RYm5BKwgjj4uPrY
         9tWh7VDMCa+JJZeBuo5cSPlAJoInzcI2bK5pBOpy27lyRKSjVdlqvjS2aIJvfkwx/X/U
         YRiYl5Vb5tyNShsvCdVhI7L7ne8iKcE4RfJfK2PTDeShQSf4HfsnoQnebtMz/00rICzY
         5A0zJMZxOL8duHtRPCKF91QA/Jr1Sl1OVfT5mw9NzPkdAQ8XHqgJngKaJOSpbejfZ7l6
         uLqw==
X-Forwarded-Encrypted: i=1; AJvYcCWHeCMdOVeVAxY25D6EYTMe5L+3vg7cvDWg/K+qfOfMduQ/EQYknunPFa0TMk8KiATWTdSBjWnRYpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Dyk73GIW2MO4xMzNfnf8CkTrx1C7aY2hld0JsGrgExpHF//o
	kKn743YzG1gW/zgn91B72pJPdbR7wMltlOWTeyihWPzX/dCJ0h2X4PnwHrISwMtZxnrM7bXNDLx
	rQFQjGASez46OxT9zJ7G3dwLz9o9Y+J6VSecMjSmlm5Ufe3mffVNXtoL1TDoN4IM=
X-Gm-Gg: AZuq6aJZ0LKu3IRKbwfuPFDLj/gwYQcx1suCX5S4/eJSqzvNp30bBaZ30ozBzLYDiNM
	N39QCdbWtpFz+AsG7DsXtnGZpFKmamvrPKW808kEBY5mu7xx8V02n6M9VdlXB3vG63aoaiBsEye
	qwJMAIPSNkg3L3nEmSsXfJ9gHX06GMvtsZCVGsGiNbfjfcXYCzOSB9UnhdTpKiArXm1wsNwfcr5
	Pu83Jy6bND5LzEstjrdvXV869uGwAOgr2zzZk/VddKiZ++y25w/eWa1KPi5hUaAtjCRpbSY3cDU
	usHdDI03KtIIP73qjS5Rolfr1wzS6lkMq4C+5f0VhAI90D5dgl9vGzMqr//Mhv0S8F3IbmzpJ0A
	pWHnljntRXSxGo7phuKiVyE/3XpTDk4s+S9Lb/NORhqBuAGi/ah/mceGuVemhKfvlYEMry5ks7o
	IppVa7u1P9mlwUfd/v1hLDFwur7ZcXdlH3rpE=
X-Received: by 2002:a05:620a:4441:b0:828:faae:b444 with SMTP id af79cd13be357-8cb7bfc8d06mr1818108885a.20.1771884756281;
        Mon, 23 Feb 2026 14:12:36 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:828:faae:b444 with SMTP id af79cd13be357-8cb7bfc8d06mr1818103585a.20.1771884755417;
        Mon, 23 Feb 2026 14:12:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7aaed3esm18805261fa.40.2026.02.23.14.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:12:34 -0800 (PST)
Date: Tue, 24 Feb 2026 00:12:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm
 DSP accelerator
Message-ID: <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
 <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699cd0d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=WRMiGO0D-mV3MfwFjRkA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5MyBTYWx0ZWRfX00QBSf9HN5b1
 zoyPh4LsZDYU69Ywv/TrxqpZxSkcPS80ny+ddmEmX7QulINOCkh8rTwg8ic1nlGzjmk+Ilx/2xa
 jeYsB1fmGIHl5f7CEeapIbqiXoL9DkjxS1O4elrUxg5dZ7IIRsv1M2lBrk1C8fVyXRK+zKDyDN5
 5temmI9zw67b30VkSAZjd+bdF3NCMR2KbAikamSWEhKZgXq8Un9y34H39V5judwJUy5g4XOcnfg
 llhA/7NhYJhww/mQGQqcyi23ohj+bgtElvb8sz9iGoKJQiCW1jn7KFjKb7gU6Ba7zd/ORifdhs3
 2DRITV2KO+M5AjxExiqd2CK1rNQXH+tZ8M70V6PuZXw8zT2WJQqPOWRReB8h0U382pzWtDkOkFp
 2yXwOh4T0Jow98LVkpJC+MPvm+apMpDS6Nr7YSHNNNThNJis7HVVGXNh9i7vP4Zl2tuQs49lH+Y
 qrjB+1qI3YefUVKvTfg==
X-Proofpoint-ORIG-GUID: h23ycO3IIzbi5ogmVbrH1A8G7YYn1d2F
X-Proofpoint-GUID: h23ycO3IIzbi5ogmVbrH1A8G7YYn1d2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230193

On Mon, Feb 23, 2026 at 03:50:32PM -0600, Bjorn Andersson wrote:
> On Mon, Feb 23, 2026 at 11:23:13PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> [..]
> > > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> [..]
> > > +/* Error logging - always logs and tracks errors */
> > > +#define qda_err(qdev, fmt, ...) do { \
> > > +	struct device *__dev = qda_get_log_device(qdev); \
> > > +	if (__dev) \
> > > +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> > > +	else \
> > > +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> > 
> > What /why? You are under drm, so you can use drm_* helpers instead.
> > 
> 
> In particular, rather than rolling our own wrappers around standard
> functions, just use dev_err() whenever you have a struct device. And for
> something like fastrpc - life starts at some probe() and ends at some
> remove() so that should be always.

I'd say differently. For the DRM devices the life cycle is centered
around the DRM device (which can outlive platform device for multiple
reasons). So, please start by registering the DRM accel device and using
it for all the logging (and btw for private data management too).

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry
