Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598B445A28C
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786543986; cv=none; b=qZ2F7aqN9Op1g6zvpPtA+IOs04z73scQdSOsqk+CImv6AH1Fe5cYxw86KJwlJoskMPs4yuitpPrf4QrbhthlNiuTKzRYq7Afu6siDhjW6yoghjlwhfA7qt2zacAvFzvMt4Kj7/zPxLmqd+jFyp0NRUHmSEtMLiKJoHKA1B2tzV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786543986; c=relaxed/simple;
	bh=t93zc7wRAwk7gcxTblnzRhaj58qkxLCyz5VKMOdtESA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+xMO9iBlwCncNPpzM3Htw1IrE885KQtlwHZ1CXFnq1/t2Ov6E0tbrzOw1EnQba/WWUzCcz7U3AT/3FlDaQ9GVL1Tjn0YfuROy2wkGWYb0Qsku+U32rNRuce3eSSA32OpuA+0UbmhqKleUIzXMD0R7MyGCrz76wUmRRqITG7jGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8qY35qU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8qY35qU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49954b88fffso11207095e9.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786543982; x=1787148782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ns5dOofzDARA0sfK6n3RJfzysxVv/8KNU5zRqXQ1YpM=;
        b=p8qY35qUkXG235pM+QLza1cEWqol0PAh+P1QUkcd4+nB1ESzLyGNAS6ggS8xMsFyej
         NiOZCsOelieUAx8w+DdweWhUvgfnKj9j5L0c14WQ/1mGhJ36hkln54YOYq+lVLDZMSxI
         8EBfmTsu4wJ8LQRyZXwq70X2fvcG358wGK4AHewh1VA+meSKjQDck1b11JRSagOAcUdV
         Zk92Ohni0D58qriBGDKJftcvqA11ZMz4gmQmJ/KYGvFzYbpx9JdHMYr+1u+yL4XtJV9Y
         mBFMaYuH/LGThrmbDHbqkzphFcthxScE2qfjZdQptdXMAJudgxj4nQV/uNNdI78N+OjC
         LfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786543982; x=1787148782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ns5dOofzDARA0sfK6n3RJfzysxVv/8KNU5zRqXQ1YpM=;
        b=e8qpn1MbOEdZOCj+RgDJ+DBj95DqYn3vVqGQy/ks6sU+uF0jBPnY1fXB+sFeRZdAMV
         p+JXEtj7TQmsGW9aa62ghah3pmjJhSSgt7tIWs29AjWIjjEBfhM6n/slAI723m2Dr4RK
         zeOxnsvIhgDpiBqbaQHUiBSFO9vH2MbYdQcsLrlRqSECWzxSl86GHmq3aGwDRANH7pvN
         mtzN+vqAOFwT0qUeyF65izqmbA61GMmoOZ8nszQWP4/l5Hxsx7ctMb8bYw+XP2OyLpqN
         qCko5m+TEWfk7lkwnLJ0rUlyipHMsPHRMw6vUteAjiqvydxHBDfifj9/39D7933K+gz0
         P32Q==
X-Gm-Message-State: AOJu0Yw85Hyom8DbG3B0YAvV43LvDi3JPo8cKxdhg8BO1w7lsmRWpKGF
	cUrjBNhRoIAL55nKyFYevX7VDCSxqF1qpQ+wEOXuipT5j5gufQTcJCW+G1UMWgpBhRc=
X-Gm-Gg: AR+sD12D2jIW/q4ikwV2w/AcBpCUeTKEz43eriqgExO6dFkXQNvhgjqtaMo3p8chv9m
	l1do67UFgektKbEKBDEt7SCe6TdA0fYaj04TEu2nHZIjoffillnBHLTlyNaj6SE2dPKGo/YV/q8
	Y05Pgcg71fIm7IpPsQ3YohZ8m/hQYGUqcycWvJUBnDbJNLENHrxyxbDURPZUx2UZUFRL2UK6DGz
	ZQgDm740FlBWVYbVaPB6jrQiFOzcON5zScY3Jija4rRKk+tWmyWw+cWA0xYgI7x69Na8q4npjGq
	Ilq3JQu2jTW3ImfqL1fD+7gyr1lv3n9Y9v9J9ZsA5CMDJivTk2itYRfB9sxC5xZffpOfh5HasOo
	avV2sIwKIQN+IpvA6zVomSuMMUAnVwiLLt8LFSNjwHq74BLqADAEbCxFaQFiXC+G+cFId4qbGzQ
	kYq2H+OM7PBLv7MZM1uAFSVoG4mALxnweqPEVQp5LeYi4ZLCAA2H7oFCCnJNsXOInWhA==
X-Received: by 2002:a05:600c:1394:b0:495:7888:281c with SMTP id 5b1f17b1804b1-4997bf6d93dmr63995455e9.0.1786543982524;
        Wed, 12 Aug 2026 07:13:02 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b33e038sm43548665e9.4.2026.08.12.07.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 07:13:02 -0700 (PDT)
Message-ID: <e7418175-3421-4cd1-be80-993ff076c9b3@linaro.org>
Date: Wed, 12 Aug 2026 15:13:00 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] perf test cs-etm: Test branch history on existing
 samples
To: Amir Ayupov <aaupov@fb.com>
Cc: linux-doc@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, linux-perf-users@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, John Garry
 <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
References: <20260803090640.2412336-1-aaupov@fb.com>
 <20260803090640.2412336-7-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260803090640.2412336-7-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/08/2026 10:06, Amir Ayupov wrote:
> Add a CoreSight shell test for --itrace=L. Record timestamped ETM trace
> with explicit -T sample timestamps and AUX pause/resume events, then
> check that the pause samples carry both a multi-frame callchain and a
> non-empty branch stack for each of the workload's two processes.
> 
> Decode the same recording with L4 and L64 and reject any branch stack
> deeper than the requested depth.
> 
> The test skips when cs_etm is absent, when not run as root, or when the
> recording turns out to lack virtual timestamps. It exercises the
> timestamp-gated path and the requested-depth bound; it does not attempt
> to verify that the attached history is correlated to the sample.
> 
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   .../tests/shell/coresight/add_last_branch.sh  | 175 ++++++++++++++++++
>   1 file changed, 175 insertions(+)
>   create mode 100755 tools/perf/tests/shell/coresight/add_last_branch.sh
> 
> diff --git a/tools/perf/tests/shell/coresight/add_last_branch.sh b/tools/perf/tests/shell/coresight/add_last_branch.sh
> new file mode 100755
> index 0000000000000..4654069ad651f
> --- /dev/null
> +++ b/tools/perf/tests/shell/coresight/add_last_branch.sh
> @@ -0,0 +1,175 @@
> +#!/bin/bash -e
> +# SPDX-License-Identifier: GPL-2.0
> +# CoreSight branch history on existing samples (exclusive)
> +
> +perf list pmu | grep -q 'cs_etm//' || exit 2
> +
> +if [ "$(id -u)" != 0 ]; then
> +	echo "[Skip] No root permission"
> +	exit 2
> +fi

Is this so you can use -C 0? It's not completely obvious what that has 
to do with the test. Can you not drop the -C option or use --per-thread 
mode with a simpler non-forking workload?

I don't mind keeping it for some variety in the tests, but it should be 
documented.

> +
> +tmpdir=$(mktemp -d /tmp/perf-cs-add-last-branch.XXXXX)
> +
> +cleanup()
> +{
> +	rm -rf "$tmpdir"
> +	trap - EXIT TERM INT
> +}
> +
> +# shellcheck disable=SC2317 # Called through trap.
> +trap_cleanup()
> +{
> +	cleanup
> +	exit 1
> +}
> +trap trap_cleanup EXIT TERM INT
> +
> +record_data()
> +{
> +	if perf record -T -o "$tmpdir/data" -C 0 \
> +		-e cs_etm/aux-action=start-paused,timestamp/u \

Timestamp needs a value on newer kernels or Perf returns an error. But 
do you need to provide the option at all? It's on by default for per-CPU 
mode.

> +		-e cycles/aux-action=resume,period=550019/u \
> +		-e cycles/aux-action=pause,period=100003,call-graph=fp/u -- \
> +		taskset --cpu-list 0 perf test -w context_switch_loop 100000 \

The other Coresight tests use --workload-ctl to record less data and 
save some decode time. I think this test might benefit from it too.

> +		>/dev/null 2>"$tmpdir/stderr"; then
> +		return 0
> +	fi
> +
> +	echo "Failed to record ETM trace with AUX pause/resume" >&2
> +	cat "$tmpdir/stderr" >&2
> +	return 1
> +}
> +
> +decode()
> +{
> +	local size=$1
> +	local output=$2
> +
> +	if perf script -i "$tmpdir/data" --itrace="L$size" \
> +		-F comm,pid,tid,event,ip,brstack >"$output" \
> +		2>"$tmpdir/stderr"; then
> +		return 0
> +	fi
> +
> +	if grep -q "itrace=L requires virtual timestamped trace" \
> +		"$tmpdir/stderr"; then
> +		echo "[Skip] Virtual CoreSight timestamps are not available"
> +		cleanup
> +		exit 2
> +	fi
> +
> +	cat "$tmpdir/stderr" >&2
> +	return 1
> +}
> +
> +check_process_samples()
> +{
> +	local output=$1
> +	local comm
> +
> +	for comm in proc1 proc2; do
> +		awk -v comm="$comm" '
> +			$1 == comm && /cycles\/aux-action=pause/ {
> +				in_sample = 1
> +				next
> +			}
> +			!NF {
> +				in_sample = 0
> +				next
> +			}
> +			in_sample && /0x[[:xdigit:]]+\/0x[[:xdigit:]]+\// {
> +				found = 1
> +			}
> +			END { exit !found }
> +		' "$output" || {
> +			echo "No pause-event branch stack found for $comm" >&2
> +			return 1
> +		}
> +	done
> +}
> +
> +check_callchains()
> +{
> +	local output="$tmpdir/script-callchain"
> +
> +	perf script -i "$tmpdir/data" -F comm,event,ip >"$output" 2>/dev/null
> +
> +	awk '
> +		/cycles\/aux-action=pause/ {
> +			in_sample = 1
> +			frames = 0
> +			next
> +		}
> +		!NF {
> +			if (in_sample && frames >= 2)
> +				found = 1
> +			in_sample = 0
> +			next
> +		}
> +		in_sample && /^[[:space:]]+[[:xdigit:]]+([[:space:]]|$)/ {
> +			frames++
> +		}
> +		END {
> +			if (in_sample && frames >= 2)
> +				found = 1
> +			exit !found
> +		}
> +	' "$output" || {
> +		echo "No multi-frame pause-event callchain found" >&2
> +		return 1
> +	}

Can you add some example output in the test saying what these awks are 
looking for. It failed for me but I wasn't sure why. I've attached my 
script-callchain file if that helps.


> +}
> +
> +check_branch_stacks()
> +{
> +	local output=$1
> +	local max_entries=$2
> +
> +	local ret
> +
> +	if awk -v max="$max_entries" '
> +		/0x[[:xdigit:]]+\/0x[[:xdigit:]]+\// {
> +			entries = 0
> +			for (i = 1; i <= NF; i++)
> +				if ($i ~ /^0x[[:xdigit:]]+\/0x[[:xdigit:]]+\//)
> +					entries++
> +			if (entries)
> +				found = 1
> +			if (entries > max) {
> +				status = 2
> +				exit
> +			}
> +		}
> +		END {
> +			if (status)
> +				exit status
> +			if (!found)
> +				exit 1
> +		}
> +	' "$output"; then
> +		return 0
> +	else
> +		ret=$?
> +	fi
> +
> +	case $ret in
> +	1) echo "No ETM branch stacks found" >&2 ;;
> +	2) echo "Branch stack exceeds requested L$max_entries depth" >&2 ;;
> +	esac
> +	return 1
> +}
> +
> +record_data
> +check_callchains
> +
> +decode 4 "$tmpdir/script-l4"
> +check_process_samples "$tmpdir/script-l4"
> +check_branch_stacks "$tmpdir/script-l4" 4
> +
> +decode 64 "$tmpdir/script-l64"
> +check_process_samples "$tmpdir/script-l64"
> +check_branch_stacks "$tmpdir/script-l64" 64
> +
> +cleanup
> +exit 0

