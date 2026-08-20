Received: from mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C912B3B1EC0
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 06:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208246; cv=none; b=kPBoghcLRDviNm02Rdnzw9ydoRLrWERhqxVZstV4VGl3Wvy/tQBglsvl7blgD4zvZs92OvJPkDttzMVAavOFARsltKn5dLKw+mo7t0FBkognw4iwa5lztm4C2ZrUZCg6OBU65kZIL48mJBZLcrmxlkGrQExnPxusPARDPfLtWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208246; c=relaxed/simple;
	bh=Nol3GUU2YLOPIn2R/eZ1KpwsPqeRPhYCLXYXNYlE5SQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=NzZ70L6WfsHKCzAgH8hHi4CiswjbPOtMC2I52jVT8g9JfojbcdReHWNSr9JXjJMwiB3CaMXSf0VV09+JpxHHJ/jYKoewxdNyVHTZVeJ+rpt2lWijTt2z4nY5Sb7kzvqV+XFPEQnsWTxtRepo1NMf5KI04LXDMHid6fQ+URDr3Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=X+yHDPpD; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="X+yHDPpD"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Nol3GUU2YLOPIn2R/eZ1KpwsPqeRPhYCLXYXNYlE5SQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787208241; v=1; x=1787813041;
 b=X+yHDPpD+kApzjcPXivbxoUsfZZob9SA5c7RqiwldqZJA2nt+U1KcLF8CG2QmnIgmaj35ufB
 vhASV5Ch6YPPLT2iqs5MwiaKGkfgUJPkvu4olN1y7cfIfmXQtw//Cxk73XkWuTW0V3OGVcFhqby
 IsDkJotf5GVn/beNJBPAN56XZIBdyPw0Gyxi2Q8IHmwaa4M+v466ZZmtq80qL/CI5bbHpY7xpS6
 BelHGFeeySOFG6fiB94H8s6t8SgkP3Cuk/4iFD03nLdjS2qajSXqhF2OZ3DeI0erFMmg88M95oq
 y1fY1HA47ACRVb7hNgzz0fEEDiuX5GV+ZaU8EVXQqKj4Q==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 5636130fba9e3595;
	Thu, 20 Aug 2026 06:44:01 +0000
X-Mizu-Trace-ID: 5636130fba9e3595
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese
 translation
From: Weijie Yuan <wy@wyuan.org>
To: Siwei Chen <anka@stu.cdut.edu.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wy@wyuan.org, 
 Siwei Chen <businiaoanka@anka1.top>
In-Reply-To: <20260817021340.17318-6-anka@stu.cdut.edu.cn>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-6-anka@stu.cdut.edu.cn>
Date: Thu, 20 Aug 2026 14:43:27 +0800
Message-Id: <178720820741.15514.10299503411650270853.b4-review@b4>
X-Mailer: b4 0.17-dev

On Mon, 17 Aug 2026 10:13:39 +0800 Siwei Chen <anka@cdut.edu.cn> wrote:
> Translate .../networking/secid.rst into Chinese.
>
> Update the translation through commit de1fd4a7b0f2
> ("docs: networking: convert secid.txt to ReST")

Acked-by: Weijie Yuan <wy@wyuan.org>

-- 
Weijie Yuan

