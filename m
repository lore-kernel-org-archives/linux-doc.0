Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DB8390222
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368028; cv=none; b=CWBzPgqZ+hBZIDO/ALXrsdLfAm60BhAbJAd7PfgffMPTXVZUDCGUxYhKAoGUKAKcjY+wQnG052VxcWmjf+HBW9YOD6EFQzZ7Xkke2rFrk4AOPsbMXsh77oxpkCgJCQXCLinfIMSQoGXapGRiwRdwp6J5XA0tY599oZ4JysJdFeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368028; c=relaxed/simple;
	bh=GSRmBhTh289JMeFAVm+lGZT1u+oVb+TsC82qWLSJGvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pfh6oGybrNtQTdbIAIBx6372xNE902ZzlUFcgN0nK+dJONAOY8NLcQoScqmUo74wypVWklyTzWKAwJa66GUJPdZ0cfvNMGtW/A8ND/tV0Iw5RFCnrzs95pnAWF45OgYHBa35URvuq3f4lYHwQvB0ctTjTK7sxG4MnjQ5pJx+Gqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HlDEIdL2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HlDEIdL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774368026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wC5nlWS/Y001sSjAKXCDip+yjnGKfdG8L6ptY0xqiA8=;
	b=HlDEIdL2ZtCCRvlLWXoPvbyKl395tnt4alN3aXtgXCgadeSDa/r0I8hnw5vwb+RqdbaaJ8
	XX7HXYWKRFK5JMAM+nA9ezfZopTk39xqjc3QE8dQvPLVjDMqlHHtNYA/PDK/4eWvOBTCon
	80l0WkZ44lbWMLIf0TZOeKl4VKZMz5w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-7rwywur6Ot6qqo9pzJ8YaA-1; Tue,
 24 Mar 2026 12:00:24 -0400
X-MC-Unique: 7rwywur6Ot6qqo9pzJ8YaA-1
X-Mimecast-MFC-AGG-ID: 7rwywur6Ot6qqo9pzJ8YaA_1774368022
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1800318005B6;
	Tue, 24 Mar 2026 16:00:22 +0000 (UTC)
Received: from [10.22.65.192] (unknown [10.22.65.192])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B2EDD180075D;
	Tue, 24 Mar 2026 16:00:18 +0000 (UTC)
Message-ID: <579827ac-a933-45ec-b396-01656c30c9e4@redhat.com>
Date: Tue, 24 Mar 2026 12:00:17 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gabriele Monaco <gmonaco@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-doc@vger.kernel.org
References: <20250809094247.8384-1-frederic@kernel.org>
 <20260324153823.VKwebBuG@linutronix.de>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260324153823.VKwebBuG@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 3/24/26 11:38 AM, Sebastian Andrzej Siewior wrote:
> On 2025-08-09 11:42:47 [+0200], Frederic Weisbecker wrote:
> …
>> --- /dev/null
>> +++ b/Documentation/admin-guide/cpu-isolation.rst
>> @@ -0,0 +1,338 @@
> …
>> +CPUSET configuration (cgroup v2)
>> +--------------------------------
>> +
>> +Assuming cgroup v2 is mounted to /sys/fs/cgroup, the following script
>> +isolates CPU 7 from scheduler domains.
>> +
>> +  cd /sys/fs/cgroup
>> +  # Activate the cpuset subsystem
>> +  echo +cpuset > cgroup.subtree_control
>> +  # Create partition to be isolated
>> +  mkdir test
>> +  cd test
>> +  echo +cpuset > cgroup.subtree_control
>> +  # Isolate CPU 7
>> +  echo 7 > cpuset.cpus
>> +  echo "isolated" > cpuset.cpus.partition
> while looking at this again, shouldn't you also do
> 	echo 7 > cpuset.cpus.exclusive
>
> to ensure the CPU isn't used somewhere else?

For backport compatibility, the use of cpuset.cpus.exclusive is optional 
for creating a local partition underneath the cgroup root. The example 
should still work without setting cpuset.cpus.exclusive.

Cheers,
Longman

