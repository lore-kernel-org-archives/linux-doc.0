Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411464;
	b=DNp3RCg/cKLPgzYn+laYruu+4/SRiIQY2ikaxlcyfybHX0zzakAWSWFpqPVRTZw7QHA1
	 3UyLLtwhFN6nsKadne+SVMayZnc8BilCeD+UjfQU0GQTmlYriJ2icroyLSlLrCSvzsTus
	 KSP1GBA1/QlN1AVQ6N4R82b+gtAoBzTa154DJ7xKfylBrreJEJAvH8BfXp1AUDWe8f4iH
	 XIng2DpPMTKxhJixqqyrsGdUeZQSahz5pzk4yE7RV/kw/JuLqi8ZbUawrWdh7lgND4vBc
	 266vBkZnB8+fMgyFuR+SMz5az0rWLl7ttKC7Nh3Siqbi9xH2GCCgN5Ae7T+MrFnrWOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=zyPyNsXNnyLp0wiWkbZYu4vFk3ow/rtQP4zegoB1/BA=;
	b=xmWayJ2iR2HpyB8dzVGjHS3asK6j1hw5IWMzl3Fie7oksV+vDPkzpxQVjVcIk+GntJKo
	 lu0F7mRcVhPdw7mwlw9TQp4SjVEOcQnpeNG3rYuLqzOgzFpCxwnjkiCU9V1V9Syq6PjxF
	 BamQoaWN066csvnms+BTr0qRFs1F/LLdILjmSOY3RMI/0oA4jr6xZq9QdDxjUv8HziI+E
	 KkcBH62T7rv6R8DrlhuGxUNCs2hmAzLimZ9tkBoOby/evVNvClmoLnFoSEi7SEoTNmwzL
	 3xUG7FHd9tqTc0vWGedYdY/QyINKBlw8jqxK20zxikXQyC//CCzfYHA4FyYwZNhh4mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=KSuOhJwR;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FC8606A324
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 15:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FC8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=KSuOhJwR
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9905d61449cso943641241.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794411462; x=1795016262; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zyPyNsXNnyLp0wiWkbZYu4vFk3ow/rtQP4zegoB1/BA=;
        b=KSuOhJwRVn6ezxXqsCVqq2eIvk3Dh/kvI46PwVUnLm7knleX/h46MK9EnsyzF2uPT2
         8znC4z0CgZzu0GCKZGNR5klElinZk1//9/Vo6D1XDoyvdj1n2JDddPbgLuO1ItUhXQYP
         ih1bhIB6EifntfuJRr1WuPoN9tze2Dpqo+wdyf7oqdDFcB4//nHcro2M8WIA8EGgKRJ7
         V0/u59fnHK2FeHAX3ugQvtmuvbdXBh3QXpHv5I49SsH2WX6vIJ8+r82opWYWS5wP43oQ
         CgvLb+EGw3c1cWJmX3IjDt+tT0oCUJB09UIjYquFsegJVlnjvDZl1t5TF38O4xHJVPmo
         rYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411462; x=1795016262;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyPyNsXNnyLp0wiWkbZYu4vFk3ow/rtQP4zegoB1/BA=;
        b=VIiR+s4OoPpglIxwnXZTc/p7Q0GJ0HSbsk49dhGC30XNKP3eTGva+34iUoYFrvX5ql
         i/O0CiQFXm4JyKur0YpZX8cTS3abHmcxxTfSRhGuPM0KgwNe28xclqwXTFGYzOYLX3K9
         pQbitAgHzlPjc6gDEIWua3ZiKo3wBVedehAjKLZFlH6u4M84EOd9WhhYLzXFynEarsve
         TupRxhiyiMofIBYXvEFZl6N92ovXTvgtuLsK7KJe1tJyQRT4NPnMZ2QqodWHZwQ6LE9e
         a2h/EEa+haLOVBcEVO3FsHYvk5snOz5bTEwscexyVwxNwjqbHEE/lzUz/6oKsoy/J533
         Q/Yg==
X-Forwarded-Encrypted: i=1; AL+hErEx+YMktPij0UnXTQqKpaJy9E1btxiz+3VgI1r/MmcqlZrxkUE5HzWk8dM3lI1PcAMXn0pQcR+l2mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CXXSSPbDNvMHgEE2STGRBh2Dpkpq1GfJGF0utCJlY6gm00OoO
	9gNweN4q0FJ1YYfEppBmHRNWbZ7BMI5IGGOf0fhWBNjC2W2lhJXHORT8Tq/dECU1iIU=
X-Gm-Gg: AYBFou0EHpOO7r2jKN1NlBBwcuSccnBAzb7fFndS151ppv09lUFPrPmw2iAOsnqjgZb
	5r8LWMsvoNAjPTNgUbw0i5B3HrIgLsWYEZtyWtq4dxNMT5uZBrDBdn+bAFFZZzPYSlGjZFC7zZQ
	DVtITslLB9jLgcRa7HxpnYSxrSsG7ftdw3aAoaNPTzUOKUa63jZp8Ab0/1AEC07heFte/YtTDZn
	OGhYTpYTZ8sQDIvT6eSiyDmRGLU8znSiagu15Alkj51w9G5Os5hxDxOb/PDJ3z1Ieum6FTpxWK0
	d6InarnQeuWOfJAjk5g7xPrc0joPsB5kl3eiU3A802J/wLHLTCa20S3r1SMbvXNZallf8eTSPxG
	wUd3x9lwHVUINzwyzBMJA3UPoHyo0f/A6/huEIp2aIRbBXEkWcGvEJ8PSA7+p7QMrYUSRulXLS6
	tYPClnecHTmD0oxp8RFJF4dita9qLiLBT0FLoHkgeGTgpO/zrPAwCBc5/d+/fRVsY0kNnEK7sCz
	reXZfByzEuILF3wrSaMdKz6xiA9zbS1bNkTyV8a5Wjn3jlPbHyfPplJ60ydjJPtM428n1vORIha
	xmHRRybIh8gEGIW39JZZOs9BhZ5Yl8xiA+tX6ytZW92F/UWQdJ29s3k8dQLwqBbz1GKMtYaT4CD
	VAU8xMEgE+JzUR5+uMiwxetuzJyTO8RUD
X-Received: by 2002:a05:6102:6f06:b0:7c3:9059:49c2 with SMTP id ada2fe7eead31-7d50609f040mr768713137.22.1794411461945;
        Wed, 11 Nov 2026 07:37:41 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aeac7sm3957545137.9.2026.11.11.07.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:37:41 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 10:37:40 -0500
Message-Id: <DMSHRWYSS8FJ.2H4W2E388G00V@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
Subject: Re: [PATCH v5 3/6] liveupdate: luo: serialize sessions via
 per-session publish helper
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-4-pasha.tatashin@soleen.com>
 <179439592040.425130.1571434550510654411.b4-review@b4>
In-Reply-To: <179439592040.425130.1571434550510654411.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> With incremental kho_block publication in place, LUO sessions can be
>> published into sh->block_set individually as they are committed, rather
>> than rebuilding the entire session serialization chain during reboot.
>>=20
>> Currently, luo_session_serialize() resets *sh->sessions_pa and
>> serializes all outgoing sessions from scratch in a single pass at reboot
>> time.
>>=20
>> Introduce luo_session_publish_one() to append a session's
>> luo_session_ser entry via kho_block_set_it_append() and move the session
>> onto sh->published_list. Update luo_session_serialize() to freeze all
>> remaining unpublished sessions first (rolling back via
>> luo_session_unfreeze_one() on failure) and then publish them in a second
>> pass.
>>=20
>> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> ---
>>  kernel/liveupdate/luo_session.c | 92 ++++++++++++++++++++++-----------
>>  1 file changed, 63 insertions(+), 29 deletions(-)
>>
>> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_ses=
sion.c
>> index 6dea359111818..caf0e85081e87 100644
>> --- a/kernel/liveupdate/luo_session.c
>> +++ b/kernel/liveupdate/luo_session.c
>> @@ -103,20 +103,30 @@
>>  static DECLARE_RWSEM(luo_session_serialize_rwsem);
>>  /**
>>   * struct luo_session_header - Header struct for managing LUO sessions.
>> - * @count:       The number of sessions currently tracked in the @list.
>> + * @count:       The number of sessions currently tracked in the header=
.
>> + * @published_count: The number of outgoing sessions currently publishe=
d in
>> + *                   @block_set.
>>   * @list:        The head of the linked list of `struct luo_session` in=
stances.
>
> Add "yet unpublished" to the description?

Yeap, will clarify list holds yet-unserialized sessions.

>> + * @published_list:  The head of the linked list of published outgoing
>> + *                   sessions, ordered identically to their entries in
>> + *                   @block_set.
>>   * @rwsem:       A read-write semaphore providing synchronized access t=
o the
>>   *               session list and other fields in this structure.
>>   * @block_set:   The set of serialization blocks.
>> + * @it:          Iterator tracking the next slot in @block_set for outg=
oing
>> + *               session serialization.
>>   * @sessions_pa: Points to the location of sessions_pa within struct lu=
o_ser.
>>   * @active:      Set to true when first initialized. If previous kernel=
 did not
>>   *               send session data, active stays false for incoming.
>>   */
>>  struct luo_session_header {
>>  	long count;
>> +	long published_count;
>>  	struct list_head list;
>> +	struct list_head published_list;
>>  	struct rw_semaphore rwsem;
>>  	struct kho_block_set block_set;
>> +	struct kho_block_set_it it;
>>  	u64 *sessions_pa;
>>  	bool active;
>>  };
>> @@ -134,12 +144,14 @@ struct luo_session_global {
>>  static struct luo_session_global luo_session_global =3D {
>>  	.incoming =3D {
>>  		.list =3D LIST_HEAD_INIT(luo_session_global.incoming.list),
>> +		.published_list =3D LIST_HEAD_INIT(luo_session_global.incoming.publis=
hed_list),
>>  		.rwsem =3D __RWSEM_INITIALIZER(luo_session_global.incoming.rwsem),
>>  		.block_set =3D KHO_BLOCK_SET_INIT(luo_session_global.incoming.block_s=
et,
>>  						sizeof(struct luo_session_ser)),
>>  	},
>>  	.outgoing =3D {
>>  		.list =3D LIST_HEAD_INIT(luo_session_global.outgoing.list),
>> +		.published_list =3D LIST_HEAD_INIT(luo_session_global.outgoing.publis=
hed_list),
>>  		.rwsem =3D __RWSEM_INITIALIZER(luo_session_global.outgoing.rwsem),
>>  		.block_set =3D KHO_BLOCK_SET_INIT(luo_session_global.outgoing.block_s=
et,
>>  						sizeof(struct luo_session_ser)),
>> @@ -186,6 +198,10 @@ static int luo_session_insert(struct luo_session_he=
ader *sh,
>>  		if (!strncmp(it->name, session->name, sizeof(it->name)))
>>  			return -EEXIST;
>>  	}
>> +	list_for_each_entry(it, &sh->published_list, list) {
>> +		if (!strncmp(it->name, session->name, sizeof(it->name)))
>> +			return -EEXIST;
>> +	}
>> =20
>>  	/*
>>  	 * For outgoing we should make sure there is room in serialization arr=
ay
>> @@ -203,6 +219,42 @@ static int luo_session_insert(struct luo_session_he=
ader *sh,
>>  	return 0;
>>  }
>> =20
>> +static void luo_session_publish_one(struct luo_session *session)
>> +{
>> +	struct luo_session_header *sh =3D &luo_session_global.outgoing;
>> +	struct luo_session_ser entry =3D {};
>> +
>> +	lockdep_assert_held_write(&sh->rwsem);
>> +	lockdep_assert_held(&session->mutex);
>> +
>> +	if (!sh->active || !sh->sessions_pa)
>> +		return;
>> +
>> +	if (!sh->published_count)
>> +		kho_block_set_it_init(&sh->it, &sh->block_set);
>> +
>> +	strscpy(entry.name, session->name, sizeof(entry.name));
>> +	entry.file_set_ser.count =3D session->file_set.count;
>> +	entry.file_set_ser.files =3D
>> +		kho_block_set_head_pa(&session->file_set.block_set);
>> +
>> +	/* This should not fail normally as blocks were pre-allocated */
>> +	if (WARN_ON_ONCE(!kho_block_set_it_append(&sh->it, &entry)))
>> +		return;
>> +
>> +	if (!sh->published_count) {
>> +		/*
>> +		 * Ensure the first block header and entry are visible before
>> +		 * publishing sessions_pa to concurrent KHO readers.
>> +		 */
>> +		smp_store_release(sh->sessions_pa,
>> +				  kho_block_set_head_pa(&sh->block_set));
>> +	}
>
>
>> +
>> +	list_move_tail(&session->list, &sh->published_list);
>> +	sh->published_count++;
>> +}
>> +
>>  static void luo_session_remove(struct luo_session_header *sh,
>>  			       struct luo_session *session)
>>  {
>> @@ -636,50 +688,32 @@ int luo_session_deserialize(void)
>>  int luo_session_serialize(void)
>>  {
>>  	struct luo_session_header *sh =3D &luo_session_global.outgoing;
>> -	struct luo_session *session;
>> -	struct kho_block_set_it it;
>> +	struct luo_session *session, *tmp;
>>  	int err;
>> =20
>>  	down_write(&luo_session_serialize_rwsem);
>>  	down_write(&sh->rwsem);
>> -	*sh->sessions_pa =3D 0;
>> -
>> -	kho_block_set_it_init(&it, &sh->block_set);
>> =20
>>  	list_for_each_entry(session, &sh->list, list) {
>> -		struct luo_session_ser *ser =3D kho_block_set_it_reserve_entry(&it);
>> -
>> -		/* This should not fail normally as blocks were pre-allocated */
>> -		if (WARN_ON_ONCE(!ser)) {
>> -			err =3D -ENOSPC;
>> -			goto err_undo;
>> -		}
>> -
>>  		err =3D luo_session_freeze_one(session);
>>  		if (err) {
>> -			kho_block_set_it_prev(&it);
>> -			goto err_undo;
>> +			list_for_each_entry_continue_reverse(session, &sh->list, list)
>> +				luo_session_unfreeze_one(session);
>> +			goto err_unlock;
>
> Why goto err_ can do this?
> I really prefer to avoid error handling inside if (err) blocks whenever
> possible.

Makes sense, will move it.

>
>>  		}
>> +	}
>> =20
>> -		strscpy(ser->name, session->name, sizeof(ser->name));
>> -		ser->file_set_ser.count =3D session->file_set.count;
>> -		ser->file_set_ser.files =3D
>> -			kho_block_set_head_pa(&session->file_set.block_set);
>> +	list_for_each_entry_safe(session, tmp, &sh->list, list) {
>> +		mutex_lock(&session->mutex);
>> +		luo_session_publish_one(session);
>
> And running a loop of _publish() in _serialize() makes my bikeshedding
> argument stronger ;-)

+1, will fix it in v6.

--=20
Pasha

