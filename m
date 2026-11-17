Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925041;
	b=MuWmMBoWbzc6Z37CkYvpjvZ1udHgzErk6+4o6w5j7Cth+8MPjqH156SZAbyiMhV47hWD
	 CzqS4rNEIs6OiJ1zqzf0sKNWZ+c4Cky3nSlUurby5X+auhZQXrnc40lUb38GDj8dEKDhF
	 KVNA4nzs1xQR+5a/CLJCFUE++P8KYJBWg46ZZSowAY7khV3rdympBq5tuo8OMCRCZxS/2
	 rh7G8kGmRIvRL9fY1yeQaJcjTWSSPtvQJ6B04k7Vnis0bYcdY9xlIZGY5SfrKiS3Dt46Y
	 YPhC5GVqTKJji+Rbyh07x3FPgrNgoaDH50hsbyDVbMBauvGm7w4VZRLwjbZf8u5ypCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925041;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=9VxCCeBGwARk4a9JULxy1X0ruw2TimLzvOr21wk/OFA=;
	b=m4eNObzALkgNtyIkHPdR49Bri7M+xYJ4h5XzvimKLOROnQ4cvDsmIoZG6Qtj6MlSsZzJ
	 lDIkRA2g2mc8nbkgUcWHlWgkHhU2XSA7gXMcwfWdb7hwaS+sIC/9UY0R6Qz6ds5ZSzOoO
	 WEcOLOwwtKrC2aUuiEDHx3rr58jL/kBTPM0Ofo6c5LHloo+qWx+vTKVDCrW4iQYew6PEJ
	 H/cr8hujS6G2wOtzB9Zge4EQ/f+52M2i5ZBJyLZgBx1SUVV/sxGIywkhlETPWLFwqkaIh
	 VMP3idST48azJ3XBCIiOWxQt9CJv8Z2QUnhWuN2XrwNhWVNPLdZ/XQwDPlhH8+6nOlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=FjC0Trbf;
	arc=none smtp.remote-ip=95.215.58.109
Received: from mta1.migadu.com (out-109.mta1.migadu.com [95.215.58.109])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C54606A32F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C54606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=FjC0Trbf
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FPCfKUpZ942CEJc/RgT0aSqLiUsnYHswG1E4nUg/N0k=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794925038; v=1; x=1795529838;
 b=FjC0TrbfuKhWk17fyehWz0EZ58H6SOF5K6l/LgiUQ5rETV/dlDwwNKmCs+CfLKr5VvbspG/J
 uvTTjK/5CcRfTR4ZVl5JY7RFRaFco2IEVS3K1PUWnWD4dgkttExwxzSZrvOI/TOuGTm9erSvV+x
 is+J1pgKaGiOy4Oj+J1EJVrk6zwNwXNDN4FW6p2AjWuVmfHtLFbQHeosmJyEUyJ/CWqwT+4dv3b
 7I+2ebYDtfAjgi+ml2owD4TYyKAxVZg7poBlCN4W67iEi3TRxKj3lsIoyYpLIyn6pERlRWvTuRQ
 DwxM/Vm2UIAut71QcpHjAh4NrL8zFWlkWRgcMK5ZV0Exw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id adf8ca9160dd2fa6;
	Tue, 17 Nov 2026 14:17:18 +0000
X-Mizu-Trace-ID: adf8ca9160dd2fa6
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 22:17:12 +0800
From: Weijie Yuan <wy@wyuan.org>
To: YikunWei <YikunWei@126.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/4] docs/zh_CN: Add four process translations
Message-ID: <avxh6NCMrsJI3f_x@wyuan.org>
References: <20261117115527.27937-1-YikunWei@126.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117115527.27937-1-YikunWei@126.com>

On Tue, Nov 17, 2026 at 07:55:21PM +0800, YikunWei wrote:
> From: Yikun Wei <YikunWei@126.com>
> 
> Changes in v2:
> - Reformat contribution-maturity-model.rst to align line lengths with the
>   English source and restore the link to the 2021 Maintainers' Summit
>   discussion, as pointed out by Dongliang Mu.
> - Send all four translations as a single patchset instead of separate
>   patches, since they share dependent changes to the process index.rst.
> 
> This series adds Chinese translations for four documents under
> Documentation/process/: the contribution maturity model, deprecated
> interfaces, backporting, and ioctl pitfalls. Index entries are updated
> accordingly.
> 
> Yikun Wei (4):
>   docs/zh_CN: Add contribution maturity model translation
>   docs/zh_CN: Add deprecated translation
>   docs/zh_CN: Add backporting translation
>   docs/zh_CN: Add botching-up-ioctls translation

Thanks for turning them into a series, please notice that Sphinx
complains:

| Documentation/translations/zh_CN/process/backporting.rst:227: WARNING: Title underline too short.
| 
| 更清晰的 diff
| ~~~~~~~~~~~~ [docutils]
| Documentation/translations/zh_CN/process/backporting.rst:246: WARNING: Title underline too short.
| 
| 合并风格与 diff3
| ~~~~~~~~~~~~~~~ [docutils]
| Documentation/translations/zh_CN/process/backporting.rst:415: WARNING: Title underline too short.
| 
| 向 stable 提交回填补丁
| ===================== [docutils]
| Documentation/translations/zh_CN/process/deprecated.rst:103: WARNING: Title underline too short.
| 
| simple_strtol()、simple_strtoll()、simple_strtoul()、simple_strtoull()
| ------------------------------------------------------------------- [docutils]
| Documentation/translations/zh_CN/process/deprecated.rst:172: WARNING: Title underline too short.
| 
| 变长数组（VLA）
| -------------- [docutils]
| Documentation/translations/zh_CN/process/deprecated.rst:182: WARNING: Title underline too short.
| 
| switch case 的隐式贯穿（fall-through）
| ------------------------------------- [docutils]
| Documentation/translations/zh_CN/process/deprecated.rst:336: WARNING: Title underline too short.
| 
| 结构体对象的明文 kmalloc 赋值
| ---------------------------- [docutils]


After fixing them locally, please wait for the subsequent reviews before
sending out your v3.

Thanks.

>  .../zh_CN/process/backporting.rst             | 464 ++++++++++++++++++
>  .../zh_CN/process/botching-up-ioctls.rst      | 186 +++++++
>  .../process/contribution-maturity-model.rst   |  83 ++++
>  .../translations/zh_CN/process/deprecated.rst | 361 ++++++++++++++
>  .../translations/zh_CN/process/index.rst      |   8 +-
>  5 files changed, 1098 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/process/backporting.rst
>  create mode 100644 Documentation/translations/zh_CN/process/botching-up-ioctls.rst
>  create mode 100644 Documentation/translations/zh_CN/process/contribution-maturity-model.rst
>  create mode 100644 Documentation/translations/zh_CN/process/deprecated.rst
