Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC04D26ED37
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 01:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784077703; cv=none; b=QO+WTK2gE8G2j6zWGRW48ElsYzYSBCClg7SBDFI7fRbfCmjHL37NkJVhrW/kItL0icIZklhJiIUld/9iJdom9jbsSfNKgVWG1Fni2eO4u7de5XE0F1daM9KUWzfkCYN302kOIlMYZXizajjWWowyL/cw5AnuweLNYm7PyDQ+We8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784077703; c=relaxed/simple;
	bh=tN35dLZPzwzi+5Sd9xksFVjFrsn7f2K4Ef6bj0jV96g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LJ9v9AS3jmy7CuoC3g4aQ17rXJugn9dgBT/7PpEbYomQETcLKETMBhxVadi9+bkuYjlj5ROXY0YdiX244XdTbwtm/+5ImqUN535wHotsTL0BZAUw8W8hsMBu+Mlfzqxnzfe+PuYLV5V3+tY/iCh/JtQld7ydAwXwDkv6ytjiqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTIv3TVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCrhHjPd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTIv3TVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCrhHjPd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IW8f2172241
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 01:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXTMMshAVtUeQo0IZUDx3gK+TpvQrcV476loM7bSKzc=; b=bTIv3TVGY9TPZ32r
	WeYkeoiwDe+S4dCEL46RoqTcV9RQrbX3KUXFsbpgCmcgjE4iqFbEEopQlayy3D+W
	HGoovpmQnRJAO1OOOORAJFG1ZRT1XJ/zVmYBY1HT7Vlj03rQzoll0REwAOma2JZV
	lvmg4mzOa60ASK1WPwKkUSIpnG4LAdCLwegm77fih29cktCXfBwq0ihd5Pb/YpS/
	oejQr3Mo09H8pvoCETvplmeoVqw0WGxkwAgPayWNYZqEPLRwwmtjFBb2IHbrHjs0
	8KtLsWNLQZSySO/jlKYjYFcP7Y0OqMvwDgwh0qsJr3PcEWYQaA0QW2TQ39H1hsTZ
	E6Y/Cw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqteq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 01:08:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso8622625a12.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 18:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784077696; x=1784682496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aXTMMshAVtUeQo0IZUDx3gK+TpvQrcV476loM7bSKzc=;
        b=jCrhHjPdiSt1PJFwxwdvi980LWTS+oRBSsRAjfeCqYO869sOiTkZIUOSRxwP2req5p
         9AJQNIUhVNiBwQWCqcprC4YnkoHy3Fl4miar3p+PSQpJLdy2k8nAO9vCD5gKpUe8sW1+
         YQCA1gDAno5EbuWz3aKKdHg+KVb2IS30Z4juAEuQskNRojriISwKxSRrX3tHlQZtNPjy
         issubbGRGLyuUX10MtZIXhZuSYBRBAeuk1LzImCat1S5J29YfPpTW8OT8cQ/1lCel6JV
         3xI36SVW3PKEMIbrlWDNqJjLGrhu8JoYVpQf1eek3Inof1lDedrKLvYvGWyi1GSlo6Qq
         YgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784077696; x=1784682496;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXTMMshAVtUeQo0IZUDx3gK+TpvQrcV476loM7bSKzc=;
        b=QQVBbMGqPcOyO9urRAfYY2vec6QAYI5CqEVF7mlBGERFYZw4bX5/by7uBa5/PDLirv
         DUyw3sSema+YRenTXo1GAi2qoC8TfbgY7/eNGPiKfznxWCoeeLiVqN28klVNB1eLITeF
         BG+eSi5KprUbzrmzHw3if0VIxaI3UUUY8/o1KFNYTpQJqveDtfDUhSGSrSQs9f7vd/Wn
         faSwJRfqqKyI5xcVq2BJm0WYzemoiFIHHrNZw0Lc1A4zLQ2EC1NwpU3VIQ6OCxPOZtJ/
         9ZpXi7qlSfzBEvHmYU3HEhMsuHh0Ila055Tdavlu4/qe7/ZVASiA/EBX1K9wf3+l5j1E
         e40A==
X-Forwarded-Encrypted: i=1; AHgh+RocqYPSVktxPtI/DulO089EbzRLcHvGmyz61GMSR8iiWsC1oG0MpzEC01hQaDadRFGo7Vv+8lk2hSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Fzc6h2PL3gBcGCy80KQEg2VrjQ5/JWjy7eWdvUmpGvJ91Pf8
	17cQ7odL7w7r0kNnkK3F51fnqlpocMxmgzpCTqPNnl8uPXCfnqvJ20rG/WncsGnxtqAeJVFetCM
	Z/4AsNE8fWL9w/1XrHhlPxBM4SqHRBhLLpvyZnJ85xq2QC0Ap/TNT4x4k3IUOCK0=
X-Gm-Gg: AfdE7cmf+kj7zri3ue7IYyfHS8XvvAYyDec2SNKWZrjwLhj0ieWxp64K+FIc7fhfeWD
	kLFlOTeOXm4M8xitY3VjDU3buLGyB41VhwSTxfI3viJEf/cpyWA5mup+wMxrdAt+K1tw8XMxKQd
	9XfmLxqBejNkTDddsjryes50oCuFXeX2+Ij41x/w4oGUYNK34UecMNLhhqTudA5OdXEwS9XjVMg
	dQBQcu81t2f6S7im343bqHQDwXexANzMcihdmH3hS44iCxC5ZF4ov62W9gkRT0R++6SymtvbcgX
	DJZIztK2HGpEWxV1Wqqn4HNC2apdH3FEajmCAcBpPE4r7eHYlb3Fptrf/xNQNeWYGRGKkUZNGy0
	T1Joog7Z/UFRCrBXTfEOkFiPHm+eUoGaT2sH8
X-Received: by 2002:a05:6a21:694:b0:3c0:9c1a:8937 with SMTP id adf61e73a8af0-3c34d8b2322mr7739464637.63.1784077696496;
        Tue, 14 Jul 2026 18:08:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:694:b0:3c0:9c1a:8937 with SMTP id adf61e73a8af0-3c34d8b2322mr7739430637.63.1784077696047;
        Tue, 14 Jul 2026 18:08:16 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm78642078c88.1.2026.07.14.18.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:08:15 -0700 (PDT)
Date: Tue, 14 Jul 2026 18:08:12 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>,
        Michael Hennerich
 <Michael.Hennerich@analog.com>,
        David Lechner <dlechner@baylibre.com>,
        Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v7 07/17] iio: test: add kunit tests for channel prefix
 naming generation
Message-ID: <20260714180812.000070c4@oss.qualcomm.com>
In-Reply-To: <egyms7ulkxsgu4pvfkoruelec3sf6ca4bndcuqkvxljrdluqwu@edlqne7oy3xs>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
	<20260707-ad9910-iio-driver-v7-7-a4ec30f63700@analog.com>
	<20260712020928.2c8d1667@jic23-huawei>
	<egyms7ulkxsgu4pvfkoruelec3sf6ca4bndcuqkvxljrdluqwu@edlqne7oy3xs>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX0fWdqcu9GgqY
 0tiTlmc+GwN2Je+g1SRI88uRk/5YU49bsAaP313KkFkz0wxQDhcoB3VRaeiL4Gn6A/O4ZB6msJr
 HQcXxp3/rx00nI/IoVdkGj6o8k93kmSJvDmLvgSTDSuS+4q5XK1q1GDPfObSSk7bKqDFj+EYHT3
 q8aaQQ5sgE1NIvArJFyfQL1z0XcSeZJ+AoqDen90LkZBWBm2CwG+zBvo52tVIel1mdUS3rtulIO
 zEF2DoEh0Aa7wcC2rLEWSGBIeJYMO0jeJxBHkX7n5v+pyPIeBwStV8355y9IIjowCxVB/i7fVdy
 cD/MQJn6AcRUNPTgOiJyiLJo2fgGDXe0vowkidEi+saiUXfNVqAOyRkRQTWf7K1yQwAClgWcUUr
 Q30R7EEIrR9U15triBmB4VrHgZeHj/7DWP3OjvOXXSl/cO4bsUAnNmsoadeiyTz1CWePB7SjkGK
 7UKl613bhezUMvVf0nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX0KnddUvshVwZ
 YkmI9Sud0SG5bAUYYlJyc7SZHg05KsLtlLq5UZJ2XRPFZzBTS95OWBOFmbKZNIWmK8qIbfL8hM9
 QblCTU0TYtMVHODx8xSPDGLXaaxw68w=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a56dd81 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=7zneujqQnARXn4JFaX0A:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: oF64iH0Flb8gVdSwr5traLwgPdyX5vP9
X-Proofpoint-ORIG-GUID: oF64iH0Flb8gVdSwr5traLwgPdyX5vP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150008

On Mon, 13 Jul 2026 10:52:56 +0100
Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:

> On 12/07/26 02:09, Jonathan Cameron wrote:
> > On Tue, 07 Jul 2026 15:04:28 +0100
> > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> >   
> > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > 
> > > Add a KUnit test suite covering __iio_chan_prefix_emit(), the helper
> > > that builds IIO sysfs attribute name prefixes from an iio_chan_spec.
> > > The suite groups cases by the enum iio_shared_by mode it exercises:
> > > 
> > >   - IIO_SHARED_BY_ALL: produces an empty prefix.
> > >   - IIO_SHARED_BY_DIR: emits direction only ("in" / "out").
> > >   - IIO_SHARED_BY_TYPE: emits "<dir>_<type>" and the differential
> > >     "<dir>_<type>-<type>" variant.
> > >   - IIO_SEPARATE: covers the full matrix of indexed, differential,
> > >     modified, output and extend_name combinations, plus the two
> > >     documented error paths (differential without indexed, differential
> > >     with modifier).
> > > 
> > > A final case exercises the seq_buf overflow path by passing an
> > > undersized buffer and expects -EOVERFLOW.
> > > 
> > > Because __iio_chan_prefix_emit() is static, the test translation unit
> > > is pulled into industrialio-core.c.  
> > 
> > Isn't there some magic route cases like this that makes it non static
> > only when self tests are enabled? 
> > Claude tells me to look at include/kunit/visibility.h  
> 
> There is, Although I think that using
> 
> 	#if IS_ENABLED(CONFIG_IIO_CHANNEL_PREFIX_KUNIT_TEST)
> 		#include "test/iio-test-channel-prefix.c"
> 	#endif
> 
> was more straight forward, less invasive and easier to change than..
> 
> 	/* In "drivers/iio/industrialio-core.c" */
> 
> 	#include <kunit/visibility.h>
> 	...
> 	VISIBLE_IF_KUNIT ssize_t __iio_chan_prefix_emit(...)
> 	{
> 	...
> 	}
> 	EXPORT_SYMBOL_IF_KUNIT(__iio_chan_prefix_emit);
> 
> 	/* In "iio_core.h" */
> 
> 	#if IS_ENABLED(CONFIG_KUNIT)
> 		ssize_t __iio_chan_prefix_emit(...);
> 	#endif
> 
> 	/* In "drivers/iio/test/iio-test-channel-prefix.c" */
> 
> 	#include <kunit/visibility.h>
> 	#include <iio_core.h>
> 	...
> 	MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> 	...
> 	// Use __iio_chan_prefix_emit() in tests

I'd rather this wasn't built into the core module.  So prefer you jump
though those hoops.

Jonathan

> 
> > 
> > Very nice.  A couple of really small additions requested inline.
> > I might well have missed where you exercised the corners requested though!
> > + I'll need an Ack from Lars for that maintainers entry. I'll guess that
> > Lars won't give one as not very active at the moment in this area.
> > 
> > Jonathan
> >   
> > > 
> > > Also, an entry is created under MAINTAINERS dedicated to tests for IIO
> > > core helpers.
> > > 
> > > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > ---
> > >  MAINTAINERS                                |   8 +
> > >  drivers/iio/industrialio-core.c            |   4 +
> > >  drivers/iio/test/Kconfig                   |  14 ++
> > >  drivers/iio/test/iio-test-channel-prefix.c | 246 +++++++++++++++++++++++++++++
> > >  4 files changed, 272 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 2b1ec46c5919..57ffc0dcfdb6 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12634,6 +12634,14 @@ F:	include/dt-bindings/iio/
> > >  F:	include/linux/iio/
> > >  F:	tools/iio/
> > >  
> > > +IIO CORE KUNIT TESTS
> > > +M:	Lars-Peter Clausen <lars@metafoo.de>  
> > 
> > I'd need an Ack from Lars for this entry.   If we don't get one are you
> > fine looking after this without Lars listed?    
> 
> That is fine, will drop his name.
> 

