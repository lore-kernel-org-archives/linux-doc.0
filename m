Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D93242AC
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 17:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260536; cv=none; b=d3+ja2203XNwXOmkqEEvH0GintOFnLPavwMqnZzg9CDbKEehlnHDcGgW+7G2S1EGZK3gZI/vphM+mxWOpbrKhn5+W7rc91bzjuitDFVX64cUqmVKQC/37IvdFiiLF2WuACjlEtVzz9mKUCwwKejpzMqi9r6nXjRxJyUG7oGLo2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260536; c=relaxed/simple;
	bh=B5LPyOWApy59FvhRnEByqk4wlO4qBooEaHT8YJ0k2J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IUyZTOcjRYG3VGgpCY9ZGd69opDY8TCuiklk7DfF+z9dOGa2tmtN+lUscolhu7KHKhSVUsBZdb1ogf1vWWX60PRli1VakMiI9lH7LEfyULMGi7XsICpU8lqAruO7wkhTkskh93rDQY5G0uK5fzl9Q5AJjbG5drzV0DumODNsRZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dgewAVFP; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dgewAVFP"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dca4debedaso2233174a34.2
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 10:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778260531; x=1778865331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rUvovzVI0WfmpARa7cBsFpdtftv1IZUf0H6p/9La+aQ=;
        b=dgewAVFPAp5hg2U2qxY/zsPuv4pyfPOdJxPcKW6iGLGjL40cP3L91Ol1SM9y3/c2Oy
         45L5G4kBhURS3mkB6occKZUUOT6BRAFlQKaJUDBuc9it9JK7bYd8dI0c5gjN3ivQW+Hv
         AORlpPKRCz1sptUXaG/zfRM5KvGYOXPOi1mxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260531; x=1778865331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUvovzVI0WfmpARa7cBsFpdtftv1IZUf0H6p/9La+aQ=;
        b=eEPMAbno25hJ07K7TxRSNdQ+Kp8T3RRTFZj5FVCjWgx5NgNFzUvfuRUTrNfRWl9v6K
         oSnYFNgSSm1CfyDtHiYN1PHTdkEGlwrF2XkwZOvTKEGnQkGVqqznk+V6S/kozhqxlxN+
         T42ReQT8HvTpa4gbl5I/Ton5sIHvI4rIeGX6J07V81rSBHi3P+3LF+CK8jFsZ32dbYL7
         bBSy3H0fnTYSLE4Lgh1cgeZ0/tpRDeNSgt+OySnmvwGWWy1Y+lRq4dDFpvoi+JsmwH8T
         EBKc6CPGxrnVDnw4gqGqquvLZPebIHO/Iz4iTqZfenzjUbrVaO7C0ikhhBDWKxAUOp9X
         LgeA==
X-Forwarded-Encrypted: i=1; AFNElJ8V32qyeXmFbxLq0zAQ8h7hiJcXZbraX4EEsE3o4U5mq4YjC8r4MuP8yuPx+Lz2OkHw7b87ZdP+rxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGwX/8sINqwhPQKih9bl0ytuwb9iZXnuLqY2CYIG5PN4usr7Bx
	n7rkC/s6zFkeVwKTiJ8goWtDcakNCmyF6plprWLgtoa8XjtY/zXpMDonvw4GIJNbj4chuCpnqaA
	G1MXL
X-Gm-Gg: AeBDietMRJuDLBYYaw+uhLh6YUKlpn+HRAfGxawzNbeRzrgIj9tFiOH8yP8gYuj3h0j
	XQekMQbseivhhKrYFUuVK+fjvp2wc464JZP+fOBE50p6x7rqEF0dIeZQCk19od0MKY1YHo5RUOx
	lfT1TnztESUSyFoMKhhdxD8z3mGfY+OF1IYv07NFbFn5bvhrx3iozBMciHHCJLeACRi6JPYpdo2
	9OE+ZPKF93oWDx7je4HRuSFR1iJkAb/a+sGQdVEnYIrxUz5oJpAYAKhIq3hl3rwfkK+xAtt+P0s
	hoRKGZKYumIQKwsB2POy6vtXHFw+S46m05n9Sd55cT4gZO18wJrU+K8nghpdB5OdnIDHzM9q1E5
	N9FLdS1Ezm/+7c57P/TH0EQsapumqm7jWRi7ArjlXDNlTTESGbqfKVTvqk1eFKYmLrV1oPsP0fd
	orEY9RgoBqO6J+odcrWA2t+RoGB/B12v8=
X-Received: by 2002:a05:6830:8089:b0:7e3:7dcf:9d3f with SMTP id 46e09a7af769-7e37dcf9f5dmr17419a34.16.1778260531374;
        Fri, 08 May 2026 10:15:31 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d50611sm1482059a34.16.2026.05.08.10.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 10:15:30 -0700 (PDT)
Message-ID: <1501caea-8cff-4968-aca6-e8d4b20e0e80@linuxfoundation.org>
Date: Fri, 8 May 2026 11:15:28 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] docs: fix repeated word 'that' across documentation
To: Adrien Reynard <reynard.adrien.08@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett
 <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>,
 Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:READ-COPY UPDATE (RCU)" <rcu@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS"
 <driver-core@lists.linux.dev>,
 "open list:FILESYSTEMS [NETFS LIBRARY]" <netfs@lists.linux.dev>,
 "open list:FILESYSTEMS [NETFS LIBRARY]" <linux-fsdevel@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260508163759.16231-1-reynard.adrien.08@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260508163759.16231-1-reynard.adrien.08@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 10:37, Adrien Reynard wrote:

Missing commit log in all your patches - I don't patch 1/5 in
my Inbox.

> Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
> ---
>   Documentation/RCU/rcu.rst                          | 2 +-
>   Documentation/driver-api/driver-model/overview.rst | 2 +-
>   Documentation/filesystems/netfs_library.rst        | 2 +-
>   Documentation/trace/histogram-design.rst           | 2 +-
>   Documentation/trace/histogram.rst                  | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/RCU/rcu.rst b/Documentation/RCU/rcu.rst
> index bf6617b330a7..320ad3292b75 100644
> --- a/Documentation/RCU/rcu.rst
> +++ b/Documentation/RCU/rcu.rst
> @@ -32,7 +32,7 @@ Frequently Asked Questions
>     Just as with spinlocks, RCU readers are not permitted to
>     block, switch to user-mode execution, or enter the idle loop.
>     Therefore, as soon as a CPU is seen passing through any of these
> -  three states, we know that that CPU has exited any previous RCU
> +  three states, we know that CPU has exited any previous RCU

The original intent might have been to say, "that cpu", so adding
the missing comma after the first "that" or change "that" to "the"
would make sense.


>     read-side critical sections.  So, if we remove an item from a
>     linked list, and then wait until all CPUs have switched context,
>     executed in user mode, or executed in the idle loop, we can
> diff --git a/Documentation/driver-api/driver-model/overview.rst b/Documentation/driver-api/driver-model/overview.rst
> index b3f447bf9f07..c1966d506d55 100644
> --- a/Documentation/driver-api/driver-model/overview.rst
> +++ b/Documentation/driver-api/driver-model/overview.rst
> @@ -55,7 +55,7 @@ struct pci_dev now looks like this::
>   Note first that the struct device dev within the struct pci_dev is
>   statically allocated. This means only one allocation on device discovery.
>   
> -Note also that that struct device dev is not necessarily defined at the
> +Note also that struct device dev is not necessarily defined at the

Sam comment here, replace "that" with "the" or add missing comma

>   front of the pci_dev structure.  This is to make people think about what
>   they're doing when switching between the bus driver and the global driver,
>   and to discourage meaningless and incorrect casts between the two.
> diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
> index ddd799df6ce3..4033de4535ac 100644
> --- a/Documentation/filesystems/netfs_library.rst
> +++ b/Documentation/filesystems/netfs_library.rst
> @@ -626,7 +626,7 @@ A number of members are available for access/use by the filesystem:
>   
>      These are set by the filesystem or the cache in ->prepare_read() or
>      ->prepare_write() for each subrequest to indicate the maximum number of
> -   bytes and, optionally, the maximum number of segments (if not 0) that that
> +   bytes and, optionally, the maximum number of segments (if not 0) that

Same here.

>      subrequest can support.
>   
>    * ``submit_extendable_to``
> diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
> index e92f56ebd0b5..949bbfdb0f16 100644
> --- a/Documentation/trace/histogram-design.rst
> +++ b/Documentation/trace/histogram-design.rst
> @@ -738,7 +738,7 @@ creates its own variable, wakeup_lat, but nothing yet uses it::
>   
>   Looking at the sched_waking 'hist_debug' output, in addition to the
>   normal key and value hist_fields, in the val fields section we see a
> -field with the HIST_FIELD_FL_VAR flag, which indicates that that field
> +field with the HIST_FIELD_FL_VAR flag, which indicates that field

Same here


>   represents a variable.  Note that in addition to the variable name,
>   contained in the var.name field, it includes the var.idx, which is the
>   index into the tracing_map_elt.vars[] array of the actual variable
> diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
> index 340bcb5099e7..5b303fabdf32 100644
> --- a/Documentation/trace/histogram.rst
> +++ b/Documentation/trace/histogram.rst
> @@ -1700,7 +1700,7 @@ to that rule is that any variable used in an expression is essentially
>   'read-once' - once it's used by an expression in a subsequent event,
>   it's reset to its 'unset' state, which means it can't be used again
>   unless it's set again.  This ensures not only that an event doesn't
> -use an uninitialized variable in a calculation, but that that variable
> +use an uninitialized variable in a calculation, but that variable

Same here

>   is used only once and not for any unrelated subsequent match.
>   
>   The basic syntax for saving a variable is to simply prefix a unique

thanks,
-- Shuah

