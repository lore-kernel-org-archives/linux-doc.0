Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6673B1EC0
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 06:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208228; cv=none; b=MRJDoxgIrKyX9RKXafkuo3Mpx7jnvp6J2G7qL6t3v4pHAAFsqgnLoXN7AOaHdpSO3O9oJF+HV7t76eQ4Erd9dy0lOojKqSDLVeNtzBciKVM17w1jSGMZZy7Ko/XTjhXHBK5oflJnjFdxyFUXCbzXie5/l7Q0YQ+xwb3TZ8dHCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208228; c=relaxed/simple;
	bh=n4sf7tmkBjwE+8se17ysuYn6I90MuAybd+3c2O2GPPk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=WUGht+gdZfOq4EyvPjDvpwPKWcGQpgE177PpC+K0dOsg7Kz6FKCE8nSHSMUDnBziB5cTa/wfZAnwM+aYYtjsdi5MWggUGXdRe7s+xT5k1JaffZvwyo/315O8T4HUTsLGqfous6t+en+N8sZVW41d5Qv6sWeyHEDFBlUOSpRIYWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=WOKkbKVb; arc=none smtp.client-ip=95.215.58.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="WOKkbKVb"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n4sf7tmkBjwE+8se17ysuYn6I90MuAybd+3c2O2GPPk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787208224; v=1; x=1787813024;
 b=WOKkbKVbcjU0dp4jSwqPM/UbcJV9HeydwD9d6COfoRya9DiHFJb1OqlzVYzgR8mWfEAEQP4k
 MuUfIMSw0gHCedPxfm++dVAZVMZKUyKbxa70PP2T+bmIjBij+t2CwMwYF6HSYu6Q8xxu5tt5X5h
 sBy2VMX0mjhfhgjDUKnmQuyKlHxz291VUaETEMpfUFnxwgWiGIVje0meHyjuuvUWD2gLJ33u6Jp
 wAAEMBpVW5MwsfT2vwn+YGF+6yi7whjtzBcFzj6bDEq8ShtvjxTKggfvrTzqbWLTkAKHyR5nLhD
 L0sbobwfnkHjEarOKtcc4bf885sWh8evztBtC0bB854Yg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id ffd72126c363201e;
	Thu, 20 Aug 2026 06:43:43 +0000
X-Mizu-Trace-ID: ffd72126c363201e
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese
 translation
From: Weijie Yuan <wy@wyuan.org>
To: Siwei Chen <anka@stu.cdut.edu.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wy@wyuan.org, 
 Siwei Chen <businiaoanka@anka1.top>
In-Reply-To: <20260817021340.17318-3-anka@stu.cdut.edu.cn>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-3-anka@stu.cdut.edu.cn>
Date: Thu, 20 Aug 2026 14:43:27 +0800
Message-Id: <178720820739.15514.16965152760079041552.b4-review@b4>
X-Mailer: b4 0.17-dev

On Mon, 17 Aug 2026 10:13:36 +0800, Siwei Chen <anka@stu.cdut.edu.cn> wrote:
> Translate .../networking/sriov.rst into Chinese.
> 
> Update the translation through commit 4558645d139c
> ("docs: net: document guidance of implementing the SR-IOV NDOs")

Reviewed-by: Weijie Yuan <wy@wyuan.org>

-- 
Weijie Yuan

