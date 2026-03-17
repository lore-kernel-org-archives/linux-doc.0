Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CED3B2FE7
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755518; cv=none; b=WquFfeIpRNMhFsAXBEfohleUKsPUx8k7G5UpqdAE7ZeGBU2SSN2CNaPGRZXA7JX4nk82w3OOBo0SzTzS9eCzdYIYdaG/mw3u88rK183FwGFkIT/UUNSdnx9XgWADl7qn/dvEitwejTzqWCW4LjA3VRfYlhK1l+Veg0zQAPcyyfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755518; c=relaxed/simple;
	bh=Yzm5FSijW0cQ/0Zb8KtjXsfCMLrubeKERrn8lSfDmFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=il47zfUy+H0BSzvennDTHJWHNtas1Ym9UpSN2SeVaHN/eUu/0tvICacaK3y3oSQiZEFls3Oes+wuiyPzSIozPTugD+dl42zmPGfiDnh/1mOg3PjzO9WxBPG5p6ItBLoVnJ9qCpgy5PSzXL+pS/19/csi+HIYeHz4FuYz2TXh3ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXeZ2p5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acUcl1Sl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXeZ2p5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acUcl1Sl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDY0qD1639416
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rReWAKQt2BQxssE02myl2YtG
	l26c9xhwvv959V1e/zs=; b=cXeZ2p5kmFF6DFS3fzSrUqCySHnJhCKWxfN6Zd9Z
	4/xutomjEKiFcOvItb9uIjSpRY93/QWETxN+BhN0j7pMY7G1PL9pT3/NBwUyDFOO
	QiFU9vJUXDnq7loxd2xCfwNl3d7O0V28itFTi8prMzM2y4yIGnO03Pl3SJ/S+AiK
	XnJqvgL0HpiUGPTfxM4DheRrjezEXIJiwFnhy91L/D66zPlblZsn6uVDSQyR7Jxm
	worZOUuIvWYPoIJY+pukPKoSjSQDSeVihN52d/t2mtpZ0pjbJJcwAGy4BeAQf5LH
	8oZ8//p5LHeu9Mn5EcdQV8xel3VtkpqhEFQni65kyXY9Lw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0cfy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:51:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso65352431cf.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773755515; x=1774360315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rReWAKQt2BQxssE02myl2YtGl26c9xhwvv959V1e/zs=;
        b=acUcl1Sll5sr6fx6QMsWipdXi3YBVrLRgqEF46NzImsWPon1PCMA1CcdhaN4K7mr38
         rDknwP6/PVrNtA/S/rCdGsuLaf64qfqMV1cdAt5lkxcpv98UzP3/KHl2vvtdsFx+ppAJ
         Wxip4FUtJwK4d5LmNGPrmMiU/I6Lod4SCaF0j40rzgGbz8eKzFiAQazoQ91VnT+wayV8
         BDR6Yo1Pr9BfDXCmklYAehLG4f/a/5cfA3ZMnsxzwAveZCb+oMY3n6Y/Wha39NJ9MsPf
         o3uHzE4p4u9H89Hz2RnVXxxu7WiI30Wt/vKtzhyO3wKcixnlQMN2SiZz+N5kJ4dWZJwy
         yjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755515; x=1774360315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rReWAKQt2BQxssE02myl2YtGl26c9xhwvv959V1e/zs=;
        b=i9pp6SrykCoTQasbZM8wFxDbY27XSE6nVleSoVssy14YLJxYyOTqb7SKMdbwrh2M4a
         9dB3fBOHQFVmYQtN2NkSL4LpnowFLwpToXjX5hK2KZztDNUZI/rd03/IQZWNNYsZqh0/
         CRnbfPSFqai4qi3gAZgLZ0Hpr29rWd7T3awWgKTJ7h7Opyo6vfp3YX/m34s8PQMcI4xU
         jVs36lnTTVm73fO2S4hYtixziM/r13VPSdaM70vV6L18ABVIXU3oikyoyqUf6BGLwkgO
         Dib04WDj3cnDCLJ0yOsbPUBAvdGyDPcgO2nUweYQEXB7zwMYKY89f4uRAVeb6CiONkCz
         ULUg==
X-Forwarded-Encrypted: i=1; AJvYcCXq+G1VVTEPCONohPomfEA5CtHl2+hJAgf4F1dBjevSp5q38JrhsRFlJw+IaqtL0VFzLGotCZNUhew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs1rsr4obQw9ESB1ysZfyPgKyBnqocVdpzEp8FtU0jalBX7qJW
	hojjTgFf7x2bUcZhM9Zqnnzar0YX5hEJtTl4nmLl1N2e55qX57WOCTl3WTBxGKQ3Zx3hq5zuuaE
	1BcAvXTsLuIINqeY8RBMIVPxX4abEKetd9yCjCZy/AC9ILWPN8B4rVHbEu57dK1E=
X-Gm-Gg: ATEYQzxsLhcIQ/K4Mz48Z02PcJQ+7n9AfJ/ccaNjMW0+OvrmEOQB/5oU0HVbvqsQLe9
	cXNhJs8daxWOS9zXQK3JdbB92mpNtRTSlwMDgrmodPMBUZOo4Zru3rUo25qfHryh7WpYadnLJjx
	7M3eliJe0Tsq/fZzzm9cgB2e80ChuYJ9uCAAk822/vTzvatDetJDqR4c41CyTQ4WBh0rVoIFRXJ
	FqximyqNW4x4flRWnyxSlj+tXB1+S3k4dGJoxbbeBVeACWMlfD//GzUIMh+mlJ1xtXsU22DXtwq
	7iTAXCftfLUDOLdWGp0ltzp6ggWNvqfMVj0ds8kzZ34EJrg0hIHO2PljZf4sLot/7cTaQSGesuG
	0CL1y4ga0MSazpDv+Goxq3oHxtGC3SIM9TQ==
X-Received: by 2002:a05:620a:450d:b0:8cd:937f:141a with SMTP id af79cd13be357-8cdb5a17fe4mr2261794285a.6.1773755515388;
        Tue, 17 Mar 2026 06:51:55 -0700 (PDT)
X-Received: by 2002:a05:620a:450d:b0:8cd:937f:141a with SMTP id af79cd13be357-8cdb5a17fe4mr2261788785a.6.1773755514721;
        Tue, 17 Mar 2026 06:51:54 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea9c36bsm72076515e9.9.2026.03.17.06.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:51:53 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:51:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <lxam2uqcunbm4plxfvpu7wje4jnkwwsafoddaurcewpdqupdgu@4kagci24bmzt>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <75a9514c-2e62-4535-b963-65a99cdfd3f6@kernel.org>
 <20260317-tough-slim-sunfish-fbe9da@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-tough-slim-sunfish-fbe9da@houat>
X-Proofpoint-ORIG-GUID: PZSrC_Kqkqz1ltoWp5fE9N2CNA-AADxe
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b95c7c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=vTr9H3xdAAAA:8 a=OGjWj8McAAAA:8 a=kkx97xTtIpc6WjRIJjcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyMiBTYWx0ZWRfX06+qvgclkAS1
 g7bnqgIXSgPIIWi3xBj/qW63TnbxtYqcssT7PsVqCwwD6QTtqTMmhBDcROMV+2ncyvob40tqKO1
 cErbfRQ79FN4bGlEF47eaQPhezyiq+UuGajAelMYk3/+kbUw7b2VgKVr+dh5bb0UequxoTdEL0l
 g9eB+h/qW4gOPSXDSu/JinH+YfAZ7n8LixK8nyOzMJpGB7ZV//fFuOBWS1G5rRN2eNfeHragKou
 nw7uSoQ0Uq9bNVF++BtqGaHsghBmwikxy3YRcl181X57oJ7HARRWCcZjjvAUnOoBaS4qr6F8Yim
 068114cVtI5vJ2SIyci4PDO9cjAnlq82yTPZvKrOLzXJf5STxShmlGxaypn03tCoXfrX46V3MAN
 WxGFO6SCPLJVYmHv4qVUiSiXi96CUO+kL57RA8Uuz4ir3afzt6NeSJWLkzfruyGsMEeIAU4GbYA
 iDDQhlVOhEDmcYcm0sQ==
X-Proofpoint-GUID: PZSrC_Kqkqz1ltoWp5fE9N2CNA-AADxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170122

On 26-03-17 14:32:47, Maxime Ripard wrote:
> On Tue, Mar 17, 2026 at 12:53:10PM +0100, Hans de Goede wrote:
> > Hi Maxime,
> > 
> > On 17-Mar-26 08:30, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > >> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > >> discussion about how large number of systems need to boot with
> > >> clk_ignore_unused. Per the discussions at the conference, the existing
> > >> behavior in the clk core is broken, and there is a desire to completely
> > >> remove this functionality.
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
> > Both things can be true at the same time. Yes there are ways to work
> > around issues causes by clk_ignore_unused and those ways should be
> > used more often. And in example of the X1E laptops I do indeed want
> > to try and figure out which clocks must not be turned off and
> > try to see if it will be accepted to mark these as CLK_IS_CRITICAL.
> > 
> > But at the same time the fundamental concept of turning off all unused
> > clocks as soon as all *builtin* drivers are done probing is a broken
> > concept when working with generic distro kernels where many drivers
> > are modules. To me it looks like this was very much made with
> > embedded systems with device specific kernels where all drivers for
> > the used SoC are builtin.
> 
> It's not about embedded systems, it's about shitty, inconsistent,
> closed-source bootloaders. If bootloaders weren't enabling far more than
> they require and / or if we could fix them when they do, we wouldn't
> have more clocks enabled than we need to.

This argument is wrong. Bootloaders need to leave resources enabled all
the time. Think of every possible peripheral that needs to work until
modules are provided. In fact, I'd argue that the more they leave
enabled the better it is for the boot-up process up until initramfs
comes, even beyond. In fact, the lack of bootloaders leaving stuff
enabled is one of the reasons we build in some of the clock controllers.

> 
> Removing clk_ignore_unused will just make end users pissed off because
> of the higher power draw.

With this I agree.

> 
> > The problem basically is, that if we want something like disabling
> > unused clocks at all (1), it should happen when all drivers including
> > those build as module have had a chance to run. ATM the clocks
> > simply get turned off too soon.
> > 
> > Also see Stephen Boyd's LPC talk about this:
> > 
> > "Make sync_state()/handoff work for the common clk framework"
> > https://lpc.events/event/17/contributions/1432/
> > 
> > When the clk framework maintainer themselves are arguing for
> > replacing the way unused clks are disabled atm with something
> > better then to me that is a clear sign that there is something
> > wrong with the current mechanism.
> 
> I have no problem with *replacing* it with something better. I looked at
> that talk already, tried to make sync_state work already and suggested
> it to Brian too. So I'm not saying it shouldn't replaced.
> 
> What I have a problem with is removing it with no viable alternative in
> sight.

Again, I agree. But moving this to a kernel config is wrong specially
since you want a single kernel image to work with different SoCs from
different vendors.
