Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461825;
	b=XWt1gLstGBbwmEwiWtiZeJzYYi29fovdQj+qWRAkYjS+TuZpGsVp8PrBpKmQvdfF7m4F
	 BFc9zA3ClYGUpHsKeg68enObzjvDVdQMmu7UoWfHnNASiMALbN9k2CHpgFivQm93oTXB9
	 LNmhMBXAOUBqBqtkJRAyyuLyYrALmbPTYDU4BMlJAdph3huRs9M4/oAraEF/wIxlcjW5H
	 NLXsQUz+t61IZhjIrTjzGRCFgZbC7xGpK7Yu4YzNX3GEBSjnm3gpn6Kz8vvxvaTkC+IEw
	 4iIFSLGNT2l8XwCAnh+fvD4uSsuy4gr1iVUQgphwcEk+yek47sp95zaKBankBa7rbnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461825;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=EG9t4mZCkW5bj94FWQdTBwdy/NVixZXrhszDaNAIfek=;
	b=mKzcz+ngPIYxbNz8No4jvq5vw/XypizwLphR1m1K0EcmCTE8sLAQY/a83KkzAwvX6mmh
	 7Si22UhMI2B/OQz1j1CeWzDDwGkbHEXw5ijh4ena96rZzO9scuzzFcL9n7VBKKTjauGsM
	 4BJ1+WGs9yoaojB5fEjHuC2XZ0J0hKDJWwylGhzIUVLe93AZX+OlznYKA8aavSNO/e7Kz
	 a/KKi+hKIQgdfbtyecuqYMOZoNQYNtupW85O6tXoKTTZZi/s15nEk1aez9t8ibO75lFne
	 TZTqvRS2qBT+lhJ5bWxMnbBxl6Ij+DVp6i2rhIzGu8Ks0NMl0pNUtCQzXRzgrTfYAug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=PQzR9qQI;
	arc=none smtp.remote-ip=95.215.58.141
Received: from mta1.migadu.com (out-141.mta1.migadu.com [95.215.58.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BCF606A333
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45BCF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=PQzR9qQI
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EG9t4mZCkW5bj94FWQdTBwdy/NVixZXrhszDaNAIfek=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794461822; v=1; x=1795066622;
 b=PQzR9qQIbf3p4A6OWITxFkEazjhTHdcwK7OI1p4iFcr8SPq+7VSMyf4XnRUKbDv46KMeCvmA
 S/wt951G7wn+0UBeO/l8PJGFm9Bs0jLxRXBioeWSBcc9PyG4Y5PGGPAR6WsG5k1u6xV3G0a+3BB
 TYocxRN4QlHq1XIuWLf+Zbho7ApxQDUsQcBtoV7EWb17Z5JNClD/iEt6HwY2AlUkTDSZD9HhPLg
 DYV1qoenas49Q9Y0/RiCqhOJgzWCpFI4hL2DK3Cr7VtRYBf+P5Vz5tA8nUiMM5lemdQQIQ3xC16
 zAAsQs7M5/z+VGBgjVgMIVIdNaNy9qtXDvUDZV5kkqXcg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0f7c7ee188fea858;
	Thu, 12 Nov 2026 05:37:02 +0000
X-Mizu-Trace-ID: 0f7c7ee188fea858
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 13:36:54 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the
 English original
Message-ID: <avVQdrfqVqRfY5ex@wyuan.org>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-4-chenyou910331@gmail.com>
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
In-Reply-To: <20261106113142.706783-4-chenyou910331@gmail.com>

On Fri, Nov 06, 2026 at 07:31:18PM +0800, Chen-Yu Yeh wrote:
> -內核長期以來都有其標準的代碼風格，如
> -:ref:`Documentation/translations/zh_CN/process/coding-style.rst <tw_codingstyle>`
> -中所述。在多數時候，該文檔中描述的準則至多被認爲是建議性的。因此，內核中存在
> -大量不符合代碼風格準則的代碼。這種代碼的存在會給內核開發人員帶來兩方面的危害。
> +核心長期以來都有其標準的程式碼風格，如
> +:ref:`Documentation/process/coding-style.rst <tw_codingstyle>` 中所述。在其中
> +大部分時間裡，該文件中描述的準則至多被認為是建議性的。因此，核心中存在大量不
> +符合程式碼風格準則的程式碼。這種程式碼的存在會給核心開發人員帶來兩方面的危害。

Sorry, but wait a minute.

You used <tw_codingstyle> label here, but after rendering, the html
output is still "Documentation/process/coding-style.rst", which is
pointing to the zh-tw translation, not the original one. So it is
inconsistent, right?

During my review of these patches, I didn't pay close attention to this
point. I'm so sorry. I originally thought that the compilation of Sphinx
would have pointed out the problem like this, but it turned out that I
had misunderstood the grammar of this "ref". Therefore I can see that
there're some instances in this serie doing like this.

I suggest that in this series, either use the full path to refer to a
file directly, or stick to the discouraged writing style and wait until
once these two series are completed, we can then carry out a thorough
cleanup. What do you think?

Regarding the "ref" of one specific section, I remember that it could be
referred to using a relative path, and with a label?

So please drop my review trailer, or directly point out that I'm
misunderstanding this again.

Thanks.

