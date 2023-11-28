Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="L6Qdp4uW"
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630CA1B5;
	Tue, 28 Nov 2023 06:42:13 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 010DC37A;
	Tue, 28 Nov 2023 14:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 010DC37A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1701182533; bh=5elQIPUJPWpjgXXToRm5fp9MBpDID3GOJ20HSNpr5Uc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L6Qdp4uWFPDCMGX4Z1HHOzPXo0jPZVQjGxpmHpMK9AnJxWGfJm92pXlZUW7A2Mju7
	 dIRwq9istL0sYg7ei3FwKTBDXlvoJWy+ol2CWXcpS7P8xzue/JB48fcSuIrBgZHXBT
	 dmvl1ZFsH04Ogm6dXL26LsvaeAOgXjhTB4cfj9hglJzUqba1fq2LIgJ6nffjLHiyuN
	 rJwAjA4Mk4WyLuu1m4dyu9aPR8vpuKLvGQuxr2aVFEXc9KTguiK8HvTGjZUrhNY1J3
	 fjfzqcgB0S8d+oJi4G4CvrHOstevwWuuaN1drgdvE/gHANgtnSumlBJGd2cXSUzik+
	 QeyEe5YDF82Kw==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH] docs: Raise the minimum Sphinx requirement to 2.4.4
In-Reply-To: <20231128023015.0e446a06@coco.lan>
References: <87sf4qvkmc.fsf@meer.lwn.net> <20231128023015.0e446a06@coco.lan>
Date: Tue, 28 Nov 2023 07:42:12 -0700
Message-ID: <877cm2uegr.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

> Em Mon, 27 Nov 2023 16:31:39 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:

>> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
>> index 1fb88fdceec3..db75b1b86086 100755
>> --- a/scripts/sphinx-pre-install
>> +++ b/scripts/sphinx-pre-install
>> @@ -32,8 +32,7 @@ my $python_cmd = "";
>>  my $activate_cmd;
>>  my $min_version;
>>  my $cur_version;
>> -my $rec_version = "1.7.9";	# PDF won't build here
>> -my $min_pdf_version = "2.4.4";	# Min version where pdf builds
>> +my $rec_version = "3.0";
>
> Please don't. 3.0 version has a broken C domain, not properly supported.
> The fixes arrived only starting at 3.1 (I guess some went to 3.2, but
> 3.1 is usable, as far as I remember).

So you're asking for 3.1 or 3.2 instead of 3.0?

Honestly, I just picked 3.0 out of the air in the hopes of eventually
deprecating 2.x.  Not lots of thought has gone into that
number...perhaps we should recommend higher yet?

Thanks,

jon
