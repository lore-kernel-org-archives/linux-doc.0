Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161531F615
	for <linux-doc@vger.kernel.org>; Sat, 27 Jan 2024 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706396162; cv=none; b=gdQ1PAikwFDV5lYm9bYfpD4iErvEoelEEAVGUZctEfMjuB6wCd58wbGo/odKzN31KQJAqP2SbeA3Wlj0C6XR69mFsxta58GbT01inakaXFe4tS1bFHeq4F1My4Bq2E2ItMXF2JUU3gwpPA5qTdd2wfDj1jRjJZ2gt2rWrJ+V3fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706396162; c=relaxed/simple;
	bh=C3l7QrZmelH9uPjQUKPiVkClqNLTtpDX8ld1vfxT3aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OY9AOFEIICr3NyBXQENS0NavUZW/oqAgwItMmrx/0Nc9lDJtUGlJdpV9zEf96QmUc65wJk1mMelVcHnrJYUqgKdQ7UqUgQSuczmE91q/N0EsygIwmovo4xrrULksUwuhEQo8mFp0X6L1haW19znSXid0iCxPBagfI4Ym6YEJSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=G7MgLZIB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G7MgLZIB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=PWfurz1oTQKl5nncLxOBWf8DG9ZNi20FGoy+07yQLcE=; b=G7MgLZIBtDc+FFq4EYBt2LFoDM
	PYYInd1OTiO22nwGRPAgMikhznMuhWZK7KZ//qO+4XAJBkSy1W/yJmJO8ygbqQdIwCr4kPSRodkMc
	gO1Fj9KbRaLJ4YlIlYc3h4yGtvv69fIqn2Qz4onEtjIEUTDkyb5Qmh/UaE/VIG14YSL19lXJLN7qs
	q/tslAhdbFtIShu+MeKNnz7KRffXu3BVNo1brgfGCrd1fyTbk9GePZwPuzvV8DSfMsxxjb9Jhx6mk
	L+9EIYuQpJJOneveV+DDjNPKZtEvu+wRaFI+MxeQLR7CRUl/QpEicLR9HZUoz4ydDhRCQXYbsQdBx
	paTMd70Q==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTraV-00000008L29-1qZd;
	Sat, 27 Jan 2024 22:55:47 +0000
Message-ID: <8789b063-9d48-4f28-a55f-432e3e360dfc@infradead.org>
Date: Sat, 27 Jan 2024 14:55:45 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/1] kernel-doc: Support arrays of pointers struct fields
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
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
 <aa94772b-7010-4bba-b099-d3b8fe1b97aa@infradead.org>
 <ZbWGfgHoZgDyXDNn@kekkonen.localdomain>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZbWGfgHoZgDyXDNn@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/27/24 14:41, Sakari Ailus wrote:
> Hi Randy,
> 
> On Sat, Jan 27, 2024 at 01:01:01PM -0800, Randy Dunlap wrote:
>> Hi Sakari,
>>
>> On 1/27/24 10:53, Sakari Ailus wrote:
>>> In a rather unusual arrangement in include/media/v4l2-vp9.h struct
>>> v4l2_vp9_frame_symbol_counts has fields that are arrays of pointers, not a
>>> pointer to an array, which is what's usually done.
>>>
>>
>> Yet another kernel-doc bug. I have a list of 5 or 6 or 8 bugs that are
>> similar to this one, but I didn't have this one.
> 
> :-)
> 
> Regular expressions are not best for parsing C. It seems to be doable in
> practice but imperfect at the same time.
> 
>>
>>
>>> Add support for such arrays of pointers to kernel-doc.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>>
>> Did this work for you?
>> I still see the same warnings as before this patch is applied.
> 
> Hmm. How did you test this? I did:
> 
> 	$ scripts/kernel-doc include/media/v4l2-vp9.h > /dev/null
> 
> Without this patch I do get a bunch of errors, with this patch there's no
> output. The produced kernel-doc seemed to be fine, too (with the
> redirection removed).
> 

I apologize. I wasn't being careful, just rushing too much.
It works well. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

>>
>>
>>> ---
>>> Hi Ricardo,
>>>
>>> I tried to ram it together with processing the rest but it seemed
>>> to complicate processing the usual fields.
>>>
>>>  scripts/kernel-doc | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>>> index e8aefd258a29..728b1ffc0478 100755
>>> --- a/scripts/kernel-doc
>>> +++ b/scripts/kernel-doc
>>> @@ -1509,6 +1509,15 @@ sub create_parameterlist($$$$) {
>>>  	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
>>>  	    save_struct_actual($param);
>>>  	    push_parameter($param, $type, $arg, $file, $declaration_name);
>>> +	} elsif ($arg =~ m/\(.+\)\s*\[/) {
>>> +	    # array-of-pointers
>>> +	    $arg =~ tr/#/,/;
>>> +	    $arg =~ m/[^\(]+\(\s*\*\s*([\w\[\]\.]*?)\s*(\s*\[\s*[\w]+\s*\]\s*)*\)/;
>>> +	    $param = $1;
>>> +	    $type = $arg;
>>> +	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
>>> +	    save_struct_actual($param);
>>> +	    push_parameter($param, $type, $arg, $file, $declaration_name);
>>>  	} elsif ($arg) {
>>>  	    $arg =~ s/\s*:\s*/:/g;
>>>  	    $arg =~ s/\s*\[/\[/g;
>>
>>
>> Thanks.
> 

-- 
#Randy
