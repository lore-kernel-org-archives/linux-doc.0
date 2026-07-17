Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA633F823B
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290011; cv=none; b=qY3coqfdXZI5xLCmamvnZX+jEVZzN1OTVkjMXUWMGzTaHSU7J/PG2kgwB9UbEpK4rg9IGGkY5w3nKNDZMh5Sl8HzeeGzORjdCrz099THCTi3lkhNZTsR0NcQsV5A3Vb5kfacc3XLSiZN0CGP3igVT6gdAFagtlUdww/LYL0sND0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290011; c=relaxed/simple;
	bh=048srMzwRasKnrUsDvsKXvG1hTBt8BEHz5gI7SXksfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SmrEiQwGfBK2Q1OUaoFf/9uvrfjenE91M8bn1FvojnU4+qKC2COXvdc7sCdyvrMAjIrrrlLVvo7Z6G/MgNv75wrOuXJu5rCybsXl7i/l1/aejKlaSKMsBHTk6ki9Z+QO8pRer/Vbsc2cezTIEfkVwm6IlCqqQOkdRkLz8UT4c1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=L8IwrUL/; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="L8IwrUL/"
Date: Fri, 17 Jul 2026 20:06:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784290006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=5K7TfQWRDUWzUoYhGeNS++I/3rfR1aXUncrONCZEo7c=;
	b=L8IwrUL/NJBZTE90sM5xjISStw6ONHQh83OEmiEhVLijISZSUw/QY1iY4iMVVC1171Lbog
	ZofE7sDQzPSmxojV0zKoMuCcT5Nit6VvSOpz+8PqyQz/KgSyhaaMxj52TaudENVFhu4K4b
	TTxjFh06NZxKqGjRDnsDjniq/5656fa31lLaTfPTq5W1tSDPGZvpnErNV7GKGO/HznuEbj
	cLc8KPDM/gugdR0DsJSmhscuwWa7mZeN7PYBErh4DKAkr/VfhGBtfRf+RuSz1SLVBiGB6J
	J0kQBd5+gg22k+9k+AyxD3o95DfK8msT2WoDH3Lue/1tqU4Q0sj6gHnikJy0nQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] docs/zh_CN: translate process/applying-patches.rst into
 Chinese
Message-ID: <cover.1784289654.git.wy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

Although this page is apparently out of date, perhaps it's not that
bad to add it, which would make our traslation simultaneous with the
English original. That said, I would also be fine if we chose not to
accept this series.

Note that patch 1/3 contains only the translated file itself, so the
document is not part of any toctree yet and Sphinx would emit an
orphan warning ("document isn't included in any toctree") at that
point; patch 2/3 fixes that by adding it to the zh_CN process index.
This follows the existing practice of single-file translation
commits. So if we want to ensure every commit can be successfully
built, I will make the corrections.

Weijie Yuan (3):
  docs/zh_CN: add process/applying-patches Chinese translation
  docs/zh_CN: add applying-patches to process index
  docs/zh_CN: link to Chinese applying-patches translation

 .../translations/zh_CN/admin-guide/README.rst |   2 +-
 .../zh_CN/process/applying-patches.rst        | 392 ++++++++++++++++++
 .../translations/zh_CN/process/howto.rst      |   2 +-
 .../translations/zh_CN/process/index.rst      |   2 +-
 4 files changed, 395 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/applying-patches.rst

-- 
2.55.0.369.ge3c30fcd466f

