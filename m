Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCC7379C4E;
	Tue, 12 May 2026 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572072; cv=none; b=mE18ZeZsZipoZy2jwvroEN0vMqNxxgXMn3PxSqHMQERMvO2VQF4bennq/AmoBk/MR+5jkcAnYS38bpmr+beQueLEJAIOsId/QAQCwsNCZNQoqG46z2ZMIc5/9mEWPAtpC4t1GRvj6cKYzY510Z1RnL3PZ9QVgLXFmYtmr0osSHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572072; c=relaxed/simple;
	bh=En+t8JCTWr28f2CTUKW3VXZTIKrsKeCfjtM9pEtz8cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGYZ/jmqtQy7ziaxT0NPZleb041vd5rjBkx4Ey0M/85TXV+4P+R9NkwMfoGViCVGEyezgH1mzCUYVluuEfnhGZgTLUNLjif3buyx3RjCNvV6Qq17jxUMKylNfwAlH/bt1vVT9z4m7oY4geH4M/W3H34caNIiwjDdiADO2tVFJ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=v+ydJXbQ; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="v+ydJXbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778572065; bh=A1gWWEdnfiVpbt8SwlLf1vkbJ8s6eN/LdkmgSTqf5xc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=v+ydJXbQoqObJyrT+fdpefrkAa4HWKc8PxvDkmxSnlc0PTXjP0IgccAQ6LAZBuYdh
	 /nSoHp9Y9jL8CTXkqadaRUKwpXMrpw91wzGY5Uoukpkrp5kk4MXTQrendTKByWRyYv
	 5PykvbHTQe93QFsAWrWAmpZL4zYhi3tUzyVojqqU=
Received: from [10.46.141.45] ([36.112.3.68])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id B9DAD42F; Tue, 12 May 2026 15:46:29 +0800
X-QQ-mid: xmsmtpt1778571989te3rzsv8b
Message-ID: <tencent_BE4D8C052157D1B38BA2F9FCA287D4C8E606@qq.com>
X-QQ-XMAILINFO: OeJ9zRfntlNPhvVoS0Rd28/94ISJ34l9Cby/cCX5+IuHqb3PwKrf2k6h+n62a+
	 XQgRdbhfQDJNKQh3PAagJBWlYbJRkrLLuPn5Os2x86wtxVP9On7fsUlYXpCVqhb8LKUydsN9DFBU
	 bbtX0NaIObGsrL9288CiDogiiEEJz/Fnx/iS5w0ih3QWmko6f5sdTedLEJDDr3m1U7iF8MI+fDN2
	 sz4Q22+jkYrSoFVhtekjoLN5cRMP6fftkm44MlMP2pPD7gGThooO4IiNIVp5oyDO0oR4kOCraVH6
	 Zg6i+73xFzyE5PBRZK5iv6L4FJD0jlRyun0wy2mWmSII3X9uShdGEhHySi867FHcDtQbJqwBkYmU
	 j4ki6JVJ6H8cK7nwiNCe/1Eo0gjv0w94zalPWP80HItNl0TYJqtyMmKhDQv9wMZPp1SAtCMQ43Rb
	 8nTuG3aDcnq3Gg5phMkSfangiQFKaNu2yYKgjdG42Eb7V0Y0JTpvzGOXu82OPzlBVB2oKk3wEmBo
	 I0hflA5TBZ9U02nyuHDUzNn+BNrCUTcRrgQVHp59K47rDuWMEaRr2iEpAYSRkVCWfXLP1PXsvpjr
	 wdjciUd9ZyyphTOiXgsYXi9gnrqzN2Y7L+RhGciR/JsWWoG/rBpQlV785vNHzdiuOAW+pxEU/6uW
	 tiYTT0ZoRLGNZOxSudNL+0HJvGi1q8o3B8/lPp37x9viCasBfR5nyej/RIjAzzQtHtgjj+qah66w
	 3vOfCrupQdPtl3vpUgv4JgIj46YqoqiQZjYArIpDZfqfK4/tsHJXYg7QtojlCq5n+nQwugAyIJN+
	 elbZBm4L/BSq5Z+Gb14q7CLYVw6ddAY+m6TzHAH6iN2m01jr59dYUcgpcfMaf0fWOk6D7dOQrT62
	 u1RggAf2Hu/QuIP3LQOdFtSIXpVFn49ioV062M9znHDO1nG1A8LZLm0emgQuTl2x32lnuf0Pgzd0
	 CdKuGN3ndM+l+OJmtwUaQlbLjHXl3Y/FgHbI8bGoM7i8DLYkzkru1VlalPPNUecGPCJMN+Pjkv/B
	 woSOpz5Ia84Gc+gUkMLp5/k6Kgz0ddcbZp3ld2KJE5zTKuhc8VgyRe8CpR+NtC9yM14sYpTY77xc
	 M1UODa
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-OQ-MSGID: <e99715f3-a79e-44d7-9304-ef63b71fe1ac@qq.com>
Date: Tue, 12 May 2026 15:46:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] mm: support zswap-backed anonymous large folio
 swapin
To: Alexandre Ghiti <alexghiti@meta.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <bhe@redhat.com>,
 Lorenzo Stoakes <ljs@kernel.org>
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
 <CAEmasaV7ejxqb9-wTT=7xdt+icxj-ZvdSLkSoC6X5i6NMfsKPQ@mail.gmail.com>
From: Fujunjie <fujunjie1@qq.com>
In-Reply-To: <CAEmasaV7ejxqb9-wTT=7xdt+icxj-ZvdSLkSoC6X5i6NMfsKPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/12/2026 12:20 PM, Alexandre Ghiti wrote:
> So I have been working on the exact same thing for some weeks now. My work is based on Usama's series [1].
> 
> The problem with large folio swapin is that it can create swap thrashing: to swap in a large folio, swap out may be necessary, as reported in [2].
> 
> I implemented quite a few throttling algorithms on top to try to avoid this issue and so far, I have had mixed/inconsistent results. 
> 
> How did you test this series? Did you encounter thrashing? Do you have performance numbers?
> 
> Happy to talk more about this, thanks for your series!
> 
> Alex
> 
> [1] https://lore.kernel.org/all/20241018105026.2521366-1-usamaarif642@gmail.com/ <https://lore.kernel.org/all/20241018105026.2521366-1-usamaarif642@gmail.com/>
> [2] https://lore.kernel.org/all/SJ0PR11MB5678A864244B09FDE4D914EEC9402@SJ0PR11MB5678.namprd11.prod.outlook.com/ <https://lore.kernel.org/all/SJ0PR11MB5678A864244B09FDE4D914EEC9402@SJ0PR11MB5678.namprd11.prod.outlook.com/>

Thanks Alexandre.

My RFC only had correctness testing so far. I tested the all-zswap path
and fallback cases under QEMU, but I don't have bare-metal
performance numbers yet.

If you are already actively working on this, I don't want to duplicate the
same effort. I will pause this RFC for now and wait for your series.

After your series is posted, I will take another look and see if there is
anything that still needs follow-up work.

Thanks for letting me know.

