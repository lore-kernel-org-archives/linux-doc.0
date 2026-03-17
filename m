Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4123C1979
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753683; cv=none; b=MDR+hokFMCSNbfvOMIzVPLg0vOEAdPXwDVAHE817+1Ly74ihuIGq/cP+1Hm+5cp4RorsnjisJ3kjx0wb+xIxdxaC0g+u1gt6AIrLqWU434MJBtWfFoI0T0GsoKKokHHcuZKRaZy4+3iKbmHmoH7Wt7l25HloPMD6viZS0o6r+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753683; c=relaxed/simple;
	bh=gh8BbM58DVW2VWsSOgtzxUQewwTrlXaK9qYuFKljTUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vo5Sc1TMj5fEMglX0GDBsLT3UUIiOkcLaJJJj1aok7azxxns1q/SWtu5GWXGA8roteh1yubd/8AH7Qe/UTc57BtoTPhtR2wPElaiZSHGsPVB4d42rZnumWgG///iWTU5Xam1YDU/4TabSlF3YHRhG95f1GcggvrjxLnfNqetjXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpXDUN/F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFbPZXKq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpXDUN/F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFbPZXKq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HAjx5U254248
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bs/XVdX+Syc7jzUumQHDiRpq
	IQFI3gKM0cJFcpCULnU=; b=PpXDUN/F2jU1KeKJC6GZTASfrUOw2/3s0q4Gc0kE
	Eldn0+ZPm2fhjFdRAHC+9qozbTXQX4xgKrNH5zmHBtpBPQPzsC1EpqEWFtsgM6yA
	wMPZzSm3mt/vWpvX9Sfrma15pL8vVslJmI94O1/wHksvmuseenEJt/AkKuwmQQke
	mYBOQdwAv7Nlm2ZRnqSRfoTGH8CTQY+gUOcfN15WccCQz3XYDQY6aJhCAsXGf5zU
	yNtgupRJyWA2+wU1pEFYR9tpqpESmPVpzKFsdyBaGiKxn1N/6KaWNpeXyekMAD1O
	FvWuncz4XePiQFdwslXlhstJ+UHZk8is31QYxsEC0zzLLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8ggbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:21:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd722c1a69so446079785a.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773753681; x=1774358481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs/XVdX+Syc7jzUumQHDiRpqIQFI3gKM0cJFcpCULnU=;
        b=YFbPZXKqQuR6y7X3adDc9mIAvAVl7HKie5d+Lln5syrXnzmyTJ66RAlZnvBppdvjvK
         o3eDRNTsgZqtWrXmfh4jLhnQmRju6XRY+5DCHV595UWiKjEHkwPdpNSmjBXmoyIdTSD5
         KxHftmnij8hOeJLhru/Hh2AMg2L1m3461S9ULmnArgv9N+BKserD9LJYdhZUcpCDGov9
         XPJ8jNH2988wpOLdMiQ7LzDZ/ZYO1oG9ELZ+2t3qOSJdVscZyEKLNz94pqhh6O4sMDUG
         Rw4cNpzGCffk3H4U0ADHZjXVhR9He5TpGAnW3hBtzYDeAK14FBapQTiyirddimSLM+/1
         QmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773753681; x=1774358481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs/XVdX+Syc7jzUumQHDiRpqIQFI3gKM0cJFcpCULnU=;
        b=TaovV/4wEfvK44yBx7rbis9fdMLp9hEG20bq0e4U+zwY7xiTYtkg6DzmQ7f+3ci4Tp
         IMJs+5sSS9C9wzE/bw7M6XhwIFaY/kyi5GtmqfSWStCKYsawy1Zd9AWryqiaz3QAsHVw
         /2ma+n+335iqCDFFbbUMS2huavWJuEYWKZHKZv9BbyKST7GMJ0TFLrr2uPJbsaFghMoy
         nI9kbdgqpkgyH8GaBFzdxPW21n5U3OhG1LHRdrb7GW85+8vsE6c5DQQqRL7B9S5WgxHG
         rL3sYDVuH/4MmStkv+Dip0Dd8uiUazxq5CGwjC2AG11/a8He9EZZFi2Sg8m4N51bJK8h
         8FYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3N52OldhHWHFgvCuc2CZvdMU/405DLLR13QgmLaCKPheEHKaxoye1h81iLuAxYwLciu5rRrYavYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzYjZDSYlYMP1J5J1xuYu2dyws9goHyl0HHbJubmPzxrZQ+gWg
	oO0XXWmPMVYilahMF89+XsHGXCjYI2BFssG/cRn+reuTRhTCJdZoLheh4NHNmGYsZ90gDacegnE
	LbEoNivjyt2JNkAnewRcB1QpmUxV8QOrBubWwuViG8NqfG7/PRipBf/uy756aDnc=
X-Gm-Gg: ATEYQzz5NVYGzNB8Rhqm8yIP03fn3RtLO9ldE8UHTLlU8PxlMwv6+xB+PC6+r9q0qe9
	LBMxsbkJ/VyrOcTF0L5zVGK3mEkDydotndS4tJbKyorVFY3fr8cJODWjdv5ZsaaXHDu37Ya5wdr
	bGBZVeQrjkSIL2PhWmMvdkpn1CxeRQMCXN4hLzzodEgYE1/DKb5/v+81iNk2ZYLHvV79qns8QJc
	+dpQTbUgNvuMLNgobqggfmwGZFZBT2syG7sL7X5/uYv+Bb+RB6LNBF9fBM2n2QMKJxgDQKtal7c
	GdagTjsps/0YdBHm9VdaH4q/JK8FU7UmK0puc8OaxT3LlaHnM1QC2KKd+UHhA/xErZQjpSNSNwj
	I2a/fIcgkyqrtKM5SSBPP7jtUwjl2wWwBgw==
X-Received: by 2002:a05:620a:4041:b0:8cd:9033:172a with SMTP id af79cd13be357-8cdb5a06007mr2228957085a.3.1773753680402;
        Tue, 17 Mar 2026 06:21:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8cd:9033:172a with SMTP id af79cd13be357-8cdb5a06007mr2228947785a.3.1773753679635;
        Tue, 17 Mar 2026 06:21:19 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea97e8esm69315175e9.5.2026.03.17.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:21:18 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:21:17 +0200
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
Message-ID: <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-notorious-classic-sunfish-d016d5@houat>
X-Proofpoint-GUID: RGM1IEF3LiWG4e0R7M26cXO89Zr9qJBF
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b95551 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=vTr9H3xdAAAA:8 a=QYElVs5_t2f3djOyXOEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: RGM1IEF3LiWG4e0R7M26cXO89Zr9qJBF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExOCBTYWx0ZWRfX5qR6NNXzSbkn
 cIlk7fpNhgA1xJnyn0Lu8bkc+v+Tar8tDGWYtet+A0eEIxsuI7rsuT97aVJFQsk1VPD3UGV/Dgi
 uzcRXFKncW6vqkSViCajd7m+KCuqdfOGxd3Gt0jV801ljW+0aTcXnTjXC8kfJfE5IoKTm09FgBa
 HjOHmOmMOWz9nZvfPL8Purb60ZfmQ8Rkun/ZeXgc8ABNPl+8SPhJ82635+rMFMXKw1uDwo9c215
 iuwDPxjiemeMMDvm+pXRehbI4jzH3BMDPYK6uLV9/OGbb9kjM+U6blVXHTunk7k4K+a1TU+9D6G
 upEk2YfpKJed5DZr43Dc+Sb2pp2Z009dQ0VUyhOEFrtUZFxL7yah7xo/y+8CU3XWtIskS1ZrHAD
 Kiy/u5/dzpJW+kA9Nage+2VDwN11bK4EwqRwzrTpaHH6GWluOn0/ft27JMPWIwk02gH7Fmwh+uj
 5svd6Fus1Ep8UXF2NTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170118

On 26-03-17 14:15:50, Maxime Ripard wrote:
> On Tue, Mar 17, 2026 at 02:14:25PM +0200, Abel Vesa wrote:
> > On 26-03-17 08:30:24, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > > > At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > > > discussion about how large number of systems need to boot with
> > > > clk_ignore_unused. Per the discussions at the conference, the existing
> > > > behavior in the clk core is broken, and there is a desire to completely
> > > > remove this functionality.
> > > 
> > > Broken how?
> > > 
> > > clk_ignore_unused is to a point where it's seriously cargo-culted and
> > > documented as a silver bullet, when in reality it's just a debug tool
> > > for broken drivers, and the driver must be fixed.
> > > 
> > > But nobody is actually fixing it.
> > > 
> > > See
> > > https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> > > for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> > > fedora wouldn't have to package anything, change anything, etc. But no,
> > > the problem is clk_ignore_unused.
> > 
> > Nope. Don't ever mark clocks as critical unless system crashes without
> > them.
> > 
> > Here is an example or why clocks cannot be marked as critical but need
> > to be kept by the clk_ignore_unused: display driver probes later.
> > If you mark it as critical you just made the clock stay enabled even
> > when display is off.
> > 
> > And this is just one example.
> 
> Then use CLK_IGNORE_UNUSED.

But there is no way of knowing in advance to which clocks should this
flag be applied. As I mentioned on this thread already, we will be
playing whack-a-mole with clocks for a long time before we get this
right.

The solution has been already discussed for a long time now and it is:
drop the clk_ignore_unused late_initcall entirely and then make a
generic sync_state callback that the clock providers can use (or they
could implement one themselves). This way, until sync_state is reached
for a specific clock provider driver, all unused clocks remain as is.
