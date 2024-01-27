Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F961A71F
	for <linux-doc@vger.kernel.org>; Sat, 27 Jan 2024 21:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706389277; cv=none; b=tqehUTlx55xZTrwqifMp05MvMD84j9UeCR8v5sWpCBfVSXdg9gEfM0M2cQxfGhQR2as0vmeD9hT5SSoGHIDQcfWI6FU8qy5kM87w91Oc06R+cci5+YYTz9iejdhddz1zvq6vpKWiqStjUkLH9xqiIkBN9dWlu7DprEyriYiv+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706389277; c=relaxed/simple;
	bh=lu4gwvw2jTlPJqw3AQyGO2FYUIHfRSSktbb9PHwjBtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dONokgeaewfQmwEqTbmJOrM8HrWY2NHM1QZBvYb+F5lPj/RUE/yU9Txtu9On0DxaXaHC5HSQem2bQyMVAHJNaHzzD+AEQrmHMhyt0PjFYI2Jn4LuNog7PTCZ0onMMBVXN3vY2gCEkFpecf7+J2A9cviTRZWyGUm68Bd0xOtIwjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZLfCLEeu; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZLfCLEeu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=E0PMFUvT9F/pOsMvSkWmkkpwxlPt9U6nd8dbg00RwDk=; b=ZLfCLEeuHif6dtPXsmeBX+sMot
	7gXdEW2DPciCLG/oWBclZCK9+TFrKkgDFrf6OFq8JUQcWCYeqCQpg0AbrFbWCYZB5G7Vld2GSqEdR
	X8fV+rZ4Liyrlkrrz4CIE7jEzm7jL4rGgGPG5NcWl4s8uoLWu5VdPmvlKKVr25nGzvgkJdUvaN2WJ
	09Qb+1t1NGVzgi2gdIWDasz+tqmOoaGNWulQZ2XAwy2w8NRdUiUI8SHpnwIxFQ0+Sn4zJ1ACbhByj
	1BKLNp1xA6bO+/80qnzzjGD7lRUZ8ZfqW9YPT5xC+8WCeKx/aui7uuwbmp07pEoUFRMmGAzgxiVlV
	X796y+TA==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTpnS-00000008C9t-3hPk;
	Sat, 27 Jan 2024 21:01:04 +0000
Message-ID: <aa94772b-7010-4bba-b099-d3b8fe1b97aa@infradead.org>
Date: Sat, 27 Jan 2024 13:01:01 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/1] kernel-doc: Support arrays of pointers struct fields
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin Liu <bin.liu@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O 'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-doc@vger.kernel.org
References: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
 <20240127185311.391940-1-sakari.ailus@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240127185311.391940-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 1/27/24 10:53, Sakari Ailus wrote:
> In a rather unusual arrangement in include/media/v4l2-vp9.h struct
> v4l2_vp9_frame_symbol_counts has fields that are arrays of pointers, not a
> pointer to an array, which is what's usually done.
> 

Yet another kernel-doc bug. I have a list of 5 or 6 or 8 bugs that are
similar to this one, but I didn't have this one.


> Add support for such arrays of pointers to kernel-doc.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>


Did this work for you?
I still see the same warnings as before this patch is applied.


> ---
> Hi Ricardo,
> 
> I tried to ram it together with processing the rest but it seemed
> to complicate processing the usual fields.
> 
>  scripts/kernel-doc | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index e8aefd258a29..728b1ffc0478 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1509,6 +1509,15 @@ sub create_parameterlist($$$$) {
>  	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
>  	    save_struct_actual($param);
>  	    push_parameter($param, $type, $arg, $file, $declaration_name);
> +	} elsif ($arg =~ m/\(.+\)\s*\[/) {
> +	    # array-of-pointers
> +	    $arg =~ tr/#/,/;
> +	    $arg =~ m/[^\(]+\(\s*\*\s*([\w\[\]\.]*?)\s*(\s*\[\s*[\w]+\s*\]\s*)*\)/;
> +	    $param = $1;
> +	    $type = $arg;
> +	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
> +	    save_struct_actual($param);
> +	    push_parameter($param, $type, $arg, $file, $declaration_name);
>  	} elsif ($arg) {
>  	    $arg =~ s/\s*:\s*/:/g;
>  	    $arg =~ s/\s*\[/\[/g;


Thanks.
-- 
#Randy
