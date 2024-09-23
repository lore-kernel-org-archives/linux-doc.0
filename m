Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA974A3E
	for <linux-doc@vger.kernel.org>; Mon, 23 Sep 2024 05:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727069815; cv=none; b=eNYkLW7PhdQ38d/dT2zq4/K8Kp3dplj5ceRg9+H5wTnOzc7opbgQgt70PYuRkFxx6hWUKvDUb2tnBZE/iMVaczMSUyErr8nemvIcTvR3JQjHvifsP4ga+oPsHiad/iIiNmGNKSPxcp4W/5pj8FWl0s14/sATa5JTTpqodioSz84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727069815; c=relaxed/simple;
	bh=0ICVLoPKV9hkYYqlpOYTjRYiJYLyrJPCy7lKsmb2ldk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbiEexmVJ23svlc1u3N+XfBuTAiZTWu08inMKHOsjS3cBu0u/qzw/8qKupz1jPwWWeISNsY94Ad2sCv2Dc6LMAcWplUUNPdkmhGXNlZowK4EZwKyk/lcF7US7syqGN6F3wE8ak2zyUGigvH85Yln6Jv9Y0KjoYgJLrjv8ms7MSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VObjnp3i; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VObjnp3i"
Message-ID: <069bc537-64a7-4a8f-9ac4-f8d5f3ef1abb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727069810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5ArjWYxitYWj5bI9i5/kXNBT6Dvx3pz/jtcB+Y8suQ=;
	b=VObjnp3iYToqVYW/78nhthu/Q0VWlHDOtEnipp1lhx8bb4wYLEL+gF7ocFg1KN5j/Af/CO
	C+ygB5FQ042BHY5oJnTCZ3l2rX8tcQE3lYUE2gagAxseiJKrsnU9p9BP6/p/eR/NJiMYqA
	pZZl2667FVszuwV/cGBRcThWrj6jCh0=
Date: Mon, 23 Sep 2024 13:36:42 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_TW+zh_CN: Make rst references unique
To: bernhard+linux-doc@lsmod.de, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
 Bernard Zhao <bernard@vivo.com>, Jonathan Corbet <corbet@lwn.net>,
 "Bernhard M. Wiedemann" <bwiedemann@suse.de>
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <20240920070144.26947-1-bernhard+linux-doc@lsmod.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20240920070144.26947-1-bernhard+linux-doc@lsmod.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2024/9/20 15:01, bernhard+linux-doc@lsmod.de 写道:
> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>
> We found that sphinx parallel processing would randomly pick
> one or the other
> https://github.com/sphinx-doc/sphinx/issues/6714#issuecomment-2362212754

It seems to be a problem left over from the initial conversion from

Simplified Chinese to Traditional Chinese.


For Simplified Chinese：

Reviewed-by: Yanteng Si <siyanteng@linux.dev>


Thanks,

Yanteng

>
> Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
> ---
>   Documentation/translations/zh_CN/dev-tools/gcov.rst | 8 ++++----
>   Documentation/translations/zh_TW/dev-tools/gcov.rst | 8 ++++----
>   2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/dev-tools/gcov.rst b/Documentation/translations/zh_CN/dev-tools/gcov.rst
> index 3158c9da1318..ea8f94852f41 100644
> --- a/Documentation/translations/zh_CN/dev-tools/gcov.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/gcov.rst
> @@ -120,7 +120,7 @@ gcov的内核分析插桩支持内核的编译和运行是在同一台机器上
>   如果内核编译和运行是不同的机器，那么需要额外的准备工作，这取决于gcov工具
>   是在哪里使用的:
>   
> -.. _gcov-test_zh:
> +.. _gcov-test_zh_CN:
>   
>   a) 若gcov运行在测试机上
>   
> @@ -140,7 +140,7 @@ a) 若gcov运行在测试机上
>       如果文件是软链接，需要替换成真正的目录文件（这是由make的当前工作
>       目录变量CURDIR引起的）。
>   
> -.. _gcov-build_zh:
> +.. _gcov-build_zh_CN:
>   
>   b) 若gcov运行在编译机上
>   
> @@ -205,7 +205,7 @@ kconfig会根据编译工具链的检查自动选择合适的gcov格式。
>   --------------------------
>   
>   用于在编译机上收集覆盖率元文件的示例脚本
> -（见 :ref:`编译机和测试机分离 a. <gcov-test_zh>` ）
> +（见 :ref:`编译机和测试机分离 a. <gcov-test_zh_CN>` ）
>   
>   .. code-block:: sh
>   
> @@ -238,7 +238,7 @@ kconfig会根据编译工具链的检查自动选择合适的gcov格式。
>   -------------------------
>   
>   用于在测试机上收集覆盖率数据文件的示例脚本
> -（见 :ref:`编译机和测试机分离 b. <gcov-build_zh>` ）
> +（见 :ref:`编译机和测试机分离 b. <gcov-build_zh_CN>` ）
>   
>   .. code-block:: sh
>   
> diff --git a/Documentation/translations/zh_TW/dev-tools/gcov.rst b/Documentation/translations/zh_TW/dev-tools/gcov.rst
> index ce1c9a97de16..39ac3fff44cd 100644
> --- a/Documentation/translations/zh_TW/dev-tools/gcov.rst
> +++ b/Documentation/translations/zh_TW/dev-tools/gcov.rst
> @@ -120,7 +120,7 @@ gcov的內核分析插樁支持內核的編譯和運行是在同一臺機器上
>   如果內核編譯和運行是不同的機器，那麼需要額外的準備工作，這取決於gcov工具
>   是在哪裏使用的:
>   
> -.. _gcov-test_zh:
> +.. _gcov-test_zh_TW:
>   
>   a) 若gcov運行在測試機上
>   
> @@ -140,7 +140,7 @@ a) 若gcov運行在測試機上
>       如果文件是軟鏈接，需要替換成真正的目錄文件（這是由make的當前工作
>       目錄變量CURDIR引起的）。
>   
> -.. _gcov-build_zh:
> +.. _gcov-build_zh_TW:
>   
>   b) 若gcov運行在編譯機上
>   
> @@ -205,7 +205,7 @@ kconfig會根據編譯工具鏈的檢查自動選擇合適的gcov格式。
>   --------------------------
>   
>   用於在編譯機上收集覆蓋率元文件的示例腳本
> -（見 :ref:`編譯機和測試機分離 a. <gcov-test_zh>` ）
> +（見 :ref:`編譯機和測試機分離 a. <gcov-test_zh_TW>` ）
>   
>   .. code-block:: sh
>   
> @@ -238,7 +238,7 @@ kconfig會根據編譯工具鏈的檢查自動選擇合適的gcov格式。
>   -------------------------
>   
>   用於在測試機上收集覆蓋率數據文件的示例腳本
> -（見 :ref:`編譯機和測試機分離 b. <gcov-build_zh>` ）
> +（見 :ref:`編譯機和測試機分離 b. <gcov-build_zh_TW>` ）
>   
>   .. code-block:: sh
>   
