Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A93218B3;
	Thu, 26 Mar 2026 23:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566559; cv=none; b=JNdmTUPYMO8ne8mQEMp7Uk1pm/DCEyuO5OxJXUe1VhxQ21+14C1WBHhE1qw4LIqgeOgeGBLpPAevJYq/0cil6+YagAXu5VAFaDs4cOJWuhm7vth6CpcLjxsC21lbQjw9hc28i2KzQjn0qsw1+fJg+6LHBLpGcdHKqSzRxpA49mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566559; c=relaxed/simple;
	bh=vetvDWr4j3w1NmAlK3HoG+gmtNSFy2bwpni5h68b7a8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/Ngm8QAg3P6wu4CiLXjQrcbKPbFXN7lXTQye26up2gygokWPqv0yzhEQ0vzMjyv7wMCXPo/8bPzKvSaZStykwuPi/g8GCOOLUnUjoXpJBiOd/tU7nmPbM5oGHDszLSpBVQ2SeCdQBXX/wRmfckjfyBC3wY0c+bs4B5kxKmLiuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gjjT34Ut; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gjjT34Ut"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=i7f1bLPK4Om34GK6H4HK4AX5iEGjoMDTS9o3h2Zr/7c=; b=gjjT34Ut6CGrWm1jIbBoJec0ZI
	vWKG5xpbwiGlpFHikFcJkzl6dnAMzIUfGFlpugmsSjF6XnOhEneBMBfhyecykphEX7xUF8Okb2ZKE
	T/51Lxq0zLavrXNQUSGkdPFaJR5ZOSltsWJO1IkVAmwdIzTm6z44kwNr3/tYgMaAyEDR2JDlxESfi
	5c8y71l45XHKCUArjklTy2suqj32r5fpB8xkS1ZileltfyYwjkdNBirCvjfN8yjxIXUa9+p8/TlUY
	ZQF6LX0WPAHZfnqlbb14d7mp2eGzE+uimHCb4msGV26jalxixr08cfK4c0PotxMF7dZxvXzYAo96a
	/qOC7iGA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tpF-00000006MfF-0oIX;
	Thu, 26 Mar 2026 23:09:17 +0000
Message-ID: <17c061f5-b864-4652-b4a2-356c7534d42b@infradead.org>
Date: Thu, 26 Mar 2026 16:09:15 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gabriele Monaco <gmonaco@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Waiman Long <longman@redhat.com>, linux-doc@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <20260326140055.41555-1-frederic@kernel.org>
 <6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
 <20260326190022.4b249f94@gandalf.local.home>
 <b5e6c518-c7c8-46f7-928c-d4be5a8365dd@infradead.org>
 <20260326190644.4b7c2b5f@gandalf.local.home>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260326190644.4b7c2b5f@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/26/26 4:06 PM, Steven Rostedt wrote:
> On Thu, 26 Mar 2026 16:03:18 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> Stephen, all I can do is make recommendations. If it hurts your eyes, tough. ;)
> 
> Who's this "Stephen" you are talking to?

Oops. I guess it's the one who accidentally wrote "he" instead of "the".
                                       (Do you like where that period  ^ is,
                                        even though it's incorrect? :)

-- 
~Randy

